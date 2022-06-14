class PassengerMailer < ApplicationMailer
  default from: 'notifications@flightbooker.com'

  def self.send_confirmation(passengers)
    @passengers = passengers
    @passengers.each do |passenger|
      confirmation(passenger).deliver_later
    end
  end

  def confirmation(passenger)
    @passenger_name = passenger.name
    @booking = Booking.find(passenger.booking.id)

    mail(to: passenger.email,
         subject: 'Confirmation of Flight')
  end
end
