class BookingsController < ApplicationController
  def create
    booking = current_user.bookings.create!(booking_params)
    trip = booking.trip
    user = booking.user

    response = { 
      status: Message.success,
      data: {
        booking_id: booking.id,
        user_id: booking.user_id,
        trip_id: booking.trip_id,
        bus_id: trip.bus_id,
        trip_date: trip.trip_date,
        seat_number: booking.seat_number,
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        created_at: booking.created_at,
        updated_at: booking.updated_at
      }
    }
    json_response(response, 200)
  end




  private

  def booking_params
    params.permit(
      :seat_number,
      :trip_id
    )
  end
end
