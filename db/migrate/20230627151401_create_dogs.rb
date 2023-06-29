class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.references :breed, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true # Add this line to create the owner_id column

      t.timestamps
    end
  end
end
