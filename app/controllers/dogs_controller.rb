class DogsController < ApplicationController
  def index
    @dogs = Dog.page(params[:page]).per(10)

    if params[:category].present? && params[:search_term].present?
      if params[:category] == "Breed"
        @dogs = @dogs.joins(:breed).where("breeds.name LIKE ?", "%#{params[:search_term]}%")
      elsif params[:category] == "Owner"
        @dogs = @dogs.joins(:owner).where("owners.name LIKE ?", "%#{params[:search_term]}%")
      elsif params[:category] == "Country"
        @dogs = @dogs.joins(:breed).where("breeds.country LIKE ?", "%#{params[:search_term]}%")
      elsif params[:category] == "Dog Name"
        @dogs = @dogs.where("name LIKE ?", "%#{params[:search_term]}%")
      end
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
