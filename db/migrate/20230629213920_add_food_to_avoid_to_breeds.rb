class AddFoodToAvoidToBreeds < ActiveRecord::Migration[7.0]
  def change
    add_column :breeds, :food_to_avoid, :string
  end
end
