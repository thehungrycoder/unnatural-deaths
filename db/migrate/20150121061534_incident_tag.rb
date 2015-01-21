class IncidentTag < ActiveRecord::Migration
  def change
    create_table :incidents_tags do |t|
      t.references :incident, index: true
      t.references :tag, index: true
    end
  end
end
