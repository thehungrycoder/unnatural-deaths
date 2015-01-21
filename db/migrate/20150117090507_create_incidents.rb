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
      t.text :references
      t.text :notes #to reviewer

      t.references :approved_by #AdminUser
      t.datetime :approved_at

      t.timestamps null: false
    end
    add_foreign_key :incidents, :districts
  end
end
