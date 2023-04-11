class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, from: 'polska32115@wp.pl', subject: 'Mail aktywacyjny - SZP')
    end

    def activation_link(reservation)
      @reservation = reservation
      mail(to: @reservation.user.email, from: 'polska32115@wp.pl', subject: "Aktywacja rezerwacji")
    end
end