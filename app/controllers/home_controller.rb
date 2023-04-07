class HomeController < ApplicationController
  def index
  end
  def reservations
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
  
  private
  
  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end

