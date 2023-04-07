class ContactFormController < ApplicationController
  def new
  end

  def create
    @contact = params[:contact]
    
    if @contact[:name].empty? || @contact[:email].empty? || @contact[:message].empty?
      flash.now[:error] = "Please fill in all fields"
      render :new
    else
      ContactMailer.contact_email(@contact).deliver_now
      flash[:notice] = "Dziękujemy za wiadomość, odpowiemy najszybciej jak to możliwe."
      redirect_to root_path
    end
  end
end
