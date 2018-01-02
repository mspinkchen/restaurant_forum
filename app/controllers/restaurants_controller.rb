class RestaurantsController < ApplicationController
  

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end


  def show
    @restaurant = Restaurant.find(params[:id])
    @categories = Category.all
    @comment = Comment.new
   end
end
