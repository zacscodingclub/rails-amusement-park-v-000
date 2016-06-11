class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if current_user.admin && @attraction.save
      redirect_to attraction_path(@attraction), :notice => "Attraction was successfully created."
    else
      render :back
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
