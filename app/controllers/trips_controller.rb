class TripsController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]

  def create 
    @trip = current_user.trips.create!(trip_params)
    response = { 
      status: Message.success,
      data: @trip
    }
    json_response(response, 200)
  end

  def index
    trips = Trip.all
    # converts activerecord object to array of hashes
    trips_json = trips.as_json
    trips_array = trips_json.map { |trip| trip.except("created_at", "updated_at", "user_id" )}
    response = { 
      status: Message.success,
      data: trips_array
    }
    json_response(response, 200)
  end

  # bus_id: user.buses[0].id, origin: "Lagos", destination: "Benin", trip_date: "2019-08-06 18:15:47", fare: "10000"

  # the trip is actually cancelled not destroyed
  def destroy
    @trip = Trip.find(params[:trip_id])
    return json_response({ 
      status: "error",
      error: "Trip is already cancelled"
    }, 400) unless @trip.status == "active"
    @trip.status = "cancelled"
    @trip.save
    response = { 
      status: Message.success,
      data: @trip
    }
    json_response(response, 200)
  end


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

  def admin_user
    return json_response({ 
      status: "error",
      error: "Unauthorized"
    }, 401) unless current_user.is_admin
  end
end
