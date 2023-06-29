class AddVetClinicToVetVisits < ActiveRecord::Migration[7.0]
  def change
    add_column :vet_visits, :vet_clinic, :string
  end
end
