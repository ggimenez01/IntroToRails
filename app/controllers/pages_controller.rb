class PagesController < ApplicationController
  def about_us
  end

  def home
  end

  def search
    @query = params[:query]
    @category = params[:category]
    @results = perform_search(@query, @category)
    @results = @results.page(params[:page]).per(10)

    render 'search_results'
  end

  private

  def perform_search(query, category)
    relation = Dog.all
  
    if category == "Breed"
      relation = relation.joins(:breed).where("breeds.name LIKE ?", "%#{query}%")
    elsif category == "Owner"
      relation = relation.joins(:owner).where("owners.name LIKE ?", "%#{query}%")
    elsif category == "Country"
      relation = relation.joins(:breed).where("breeds.country LIKE ?", "%#{query}%")
    elsif category == "Name" || category == "All"
      relation = relation.where("name LIKE ?", "%#{query}%")
    elsif category == "Age"
      relation = relation.where("age = ?", query.to_i)
    end
  
    relation
  end
  
  
end
