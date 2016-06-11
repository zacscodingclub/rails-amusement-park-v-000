class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find(user_id)
    @attraction = Attraction.find(attraction_id)
    not_tall_enough = @user.height < @attraction.min_height
    not_enough_tickets = @user.tickets < @attraction.tickets

    if not_enough_tickets && not_tall_enough
      msg = "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif not_enough_tickets
      msg = "Sorry. You do not have enough tickets the #{@attraction.name}."
    elsif not_tall_enough
      msg = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
      msg = "Thanks for riding the #{@attraction.name}!"
    end
  end
end
