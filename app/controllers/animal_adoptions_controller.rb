class AnimalAdoptionsController < ApplicationController
    def index
        @animal_data = AnimalAdoption.page(params[:page]).per(10)
    end
  
    def show
      @animal = AnimalAdoption.find_by(animalid: params[:id])
      raise ActiveRecord::RecordNotFound if @animal.nil?
    end
  end
  