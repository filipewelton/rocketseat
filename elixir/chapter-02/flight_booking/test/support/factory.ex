defmodule FlightBooking.Factory do
  use ExMachina

  alias FlightBooking.Users.User
  alias FlightBooking.Bookings.Booking

  def user_factory do
    %User{
      id: Faker.UUID.v4(),
      name: Faker.Person.first_name(),
      email: Faker.Internet.email(),
      cpf: "12345678900"
    }
  end

  def booking_factory do
    %Booking{
      id: Faker.UUID.v4(),
      complete_date: NaiveDateTime.utc_now(),
      local_origin: [Faker.Address.latitude(), Faker.Address.longitude()],
      local_destination: [Faker.Address.latitude(), Faker.Address.longitude()],
      user_id: Faker.UUID.v4()
    }
  end
end
