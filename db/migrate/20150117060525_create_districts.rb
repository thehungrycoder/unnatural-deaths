class CreateDistricts < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      # Create a default user
      require Rails.root.join('db', 'seed', 'districts.rb')
    end
  end


  def change
    create_table :districts do |t|
      t.string :name
      t.string :division
      t.string :country, default: 'Bangladesh'

      t.timestamps null: false
    end
  end
end
