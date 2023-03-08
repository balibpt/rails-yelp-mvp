class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %w[show destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant
  end

  def new
    @restaurant = Restaurant.new
    render 'restaurants/new'
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_number, :category, :address)
  end
end
