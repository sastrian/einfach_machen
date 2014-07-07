class PagesController < ApplicationController
  def home
  end

  def who
  end

  def what
  end

  def pearl    
    @pearls = Pearl.paginate(:page => params[:page], :per_page => 6).includes(:user)
  end

  def forum
  end

  def contact
    @contact = Contact.new
  end
  
  def contacted
    @contact = Contact.new(params[:contact])    
    if simple_captcha_valid?
      @contact.request = request
      if @contact.deliver      
        flash.now[:notice] = 'Thank you for your message!'
      else
        flash.now[:error] = 'Cannot send message.'
        render :contact
      end
    else
      flash.now[:error] = 'Captche falsch.'
      render :contact
    end       
  end
  
end
