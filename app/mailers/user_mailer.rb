class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Mail aktywacyjny - SZP')
    end

    def activation_link(reservation)
      @reservation = reservation

      mail(to: @reservation.user.email, subject: "Aktywacja rezerwacji")

    end
  end
  