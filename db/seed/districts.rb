filepath = "#{Rails.root}/data/districts.yml"
lines = YAML.load_file(filepath)
lines.each do |division, districts|
  districts.each do |district|
    if district.present?
      District.where(name: district.humanize).where(division: division).first_or_create
    end
  end
end
