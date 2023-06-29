class CreateAnimalAdoptions < ActiveRecord::Migration[7.0]
  def change
    create_table :animal_adoptions do |t|
      t.string :animalid
      t.string :intype
      t.date :indate
      t.string :petname
      t.string :animaltype
      t.string :petage
      t.string :petsize
      t.string :color
      t.string :breed
      t.string :sex
      t.string :url
      t.string :crossing

      t.timestamps
    end
  end
end
