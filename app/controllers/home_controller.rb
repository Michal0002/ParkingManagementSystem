class HomeController < ApplicationController
  def index
    @reservations = current_user.reservations
  end
end
