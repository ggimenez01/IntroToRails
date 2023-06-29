class CreateVetVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :vet_visits do |t|
      t.date :visit_date
      t.text :description
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
