class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :group
      t.string :section
      t.string :country
      t.string :url
      t.string :image
      t.string :pdf

      t.timestamps
    end
  end
end
