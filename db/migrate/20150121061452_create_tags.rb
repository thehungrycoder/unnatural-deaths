class CreateTags < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      # Create a default user
      require Rails.root.join('db', 'seed', 'tags.rb')
    end
  end
  def change
    create_table :tags do |t|
      t.string :category
      t.string :name

      t.timestamps null: false
    end
  end
end
