class PagesController < ApplicationController
  def home
  end

  def who
  end

  def what
  end

  def pearl    
    @pearls = Pearl.paginate(:page => params[:page], :per_page => 6)
  end

  def forum
  end

  def contact
    @contact = Contact.new
  end
  
  def contacted
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver      
      flash.now[:notice] = 'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
  
end
