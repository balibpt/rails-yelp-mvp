class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %w[show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
