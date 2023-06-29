class VetVisit < ApplicationRecord
  belongs_to :dog
  has_one :breed, through: :dog

  validates :visit_date, presence: true
  validates :description, presence: true
  validates :vet_clinic, presence: true
end

class VetVisitsController < ApplicationController
  def index
    @vet_visits = VetVisit.includes(dog: :breed).page(params[:page])
  end

  def show
    @vet_visit = VetVisit.includes(:dog).find(params[:id])
  end

  def create
    @vet_visit = VetVisit.new(vet_visit_params)
    @vet_visit.vet_clinic = Faker::Company.name

    if @vet_visit.save
      redirect_to @vet_visit, notice: 'Vet visit was successfully created.'
    else
      render :new
    end
  end

  private

  def vet_visit_params
    params.require(:vet_visit).permit(:visit_date, :description, :dog_id)
  end
end
