filepath = "#{Rails.root}/data/tags.yml"
lines = YAML.load_file(filepath)
lines.each do |category, tags|
  tags.each do |tag|
    if tag.present?
      Tag.where(name: tag.humanize).where(category: category).first_or_create
    end
  end
end
