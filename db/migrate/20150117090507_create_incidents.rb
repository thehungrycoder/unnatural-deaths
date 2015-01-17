class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :title
      t.text :details
      t.string :incident_type
      t.integer :total_victims

      t.integer :men_wonded
      t.integer :women_wonded
      t.integer :minor_wonded

      t.integer :men_dead
      t.integer :women_dead
      t.integer :minor_dead
      t.references :district, index: true
      t.string :location
      t.text :links

      t.boolean :approved, default: false
      t.references :approved_by #AdminUser

      t.timestamps null: false
    end
    add_foreign_key :incidents, :districts
  end
end
