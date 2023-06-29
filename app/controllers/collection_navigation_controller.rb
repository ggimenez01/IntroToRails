class CollectionNavigationController < ApplicationController
  def index
    @dogs = Dog.all
    @breeds = Breed.all
    @owners = Owner.all
    @vet_visits = VetVisit.all
  end
end
