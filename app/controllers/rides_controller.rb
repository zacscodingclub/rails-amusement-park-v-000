class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    @user = User.find(ride_params[:user_id])
    message = @ride.take_ride
    redirect_to user_path(@user), notice: message
  end

  private
    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
end
