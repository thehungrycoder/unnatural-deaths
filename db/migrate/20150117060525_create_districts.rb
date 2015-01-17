class CreateDistricts < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default user
    require Rails.root.join('db', 'seed', 'districts.rb')
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
