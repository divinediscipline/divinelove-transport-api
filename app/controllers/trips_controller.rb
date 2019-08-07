class TripsController < ApplicationController
  def create 
    @trip = current_user.trips.create!(trip_params)
    response = { 
      status: Message.success,
      data: @trip
    }
    json_response(response, 200)
  end

  # bus_id: user.buses[0].id, origin: "Lagos", destination: "Benin", trip_date: "2019-08-06 18:15:47", fare: "10000"

  private

  def trip_params
    params.permit(
      :bus_id,
      :origin,
      :destination,
      :trip_date,
      :fare
    )
  end
end
