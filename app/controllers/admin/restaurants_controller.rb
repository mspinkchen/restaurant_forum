class Admin::RestaurantsController < Admin::BaseController
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end


  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash[:alert] = "Restaurant was faild to create"
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @restaurant.update(restaurant_params)
       redirect_to admin_restaurant_path(@restaurant)
       flash[:notice] = "Restaurant was successfully updated"
    else
       render :edit
       flash[:alert] = "Restaurant was faild to update"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert]="restaurant was deleted"
  end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])  
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hour, :description, :image, :category_id)
  end

end
