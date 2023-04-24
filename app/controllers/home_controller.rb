class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def reservations
    @reservations = current_user.reservations
  end
  def reservations_current
    @reservations = current_user.reservations
  end
  def contact
    @contact_form = ContactForm.new
  end
  
  def create_message
    @contact_form = ContactForm.new(contact_params)
    
    if @contact_form.valid?
      ContactMailer.contact_email(@contact_form).deliver_now
      
      flash[:notice] = "Wiadomość została wysłana!"
      redirect_to root_path
    else
      flash[:alert] = "Nie udało się wysłać wiadomości. Sprawdź poprawność wprowadzonych danych."
      render :contact
    end
  end
  def search
    @reservations = Reservation.joins(:user)
    if params[:license_plate].present?
      @reservations = @reservations.where("LOWER(reservations.license_plate) LIKE ?", "%#{params[:license_plate].downcase}%")
    end
    if params[:first_name].present?
      @reservations = @reservations.where("LOWER(users.first_name) LIKE ?", "%#{params[:first_name].downcase}%")
    end
    if params[:last_name].present?
      @reservations = @reservations.where("LOWER(users.last_name) LIKE ?", "%#{params[:last_name].downcase}%")
    end
    if params[:phone].present?
      @reservations = @reservations.where("LOWER(users.phone) LIKE ?", "%#{params[:phone].downcase}%")
    end
    @reservations = @reservations.order(created_at: :desc)

    params[:license_plate] = nil
    params[:first_name] = nil
    params[:last_name] = nil
    params[:phone] = nil
  
    render :search
  end
  
  private
  
  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end

