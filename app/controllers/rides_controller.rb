class RidesController < ApplicationController

  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride.take_ride
    flash[:notice] = "Thanks for riding the #{@ride.name}!"
    redirect_to user_path(@ride.user)
  end

end
