class BreedsController < ApplicationController
  def index
    @dogs = Dog.includes(:breed).all
    @dogs = @dogs.page(params[:page]).per(10)
  end
  def show
    @breed = Breed.find(params[:id])
  end
  
end
