class Admin::AttendeesController < Admin::AdminController
  layout false
  before_filter :set_attendee, :except => [:index]
  
  def index
    session_admin_order(params[:o])
    @attendees = Attendee.all :order => (session[:admin_attendee_order])
    @attendees_counts = Attendee.count("status", :group => "status")
  end

  def show
  end

  def edit
  end

  def update
    if @attendee.update_attributes(params[:attendee])
      flash[:notice] = 'Attendee was successfully updated.'
      redirect_to([:admin, @attendee])
    else
      render :action => "edit"
    end
  end

  def destroy
    @attendee.destroy
    redirect_to(admin_attendees_url)
  end
  
  def resend
    flash[:notice] = "Send email to '#{@attendee.email}'"
    @attendee.send_mail_after_create
    redirect_to(admin_attendees_url)
  end
  
  def completed
    change_status
  end
  
  def pending
    change_status
  end
  
  def approved
    change_status
  end
  
  def verifying
    change_status
  end
  
  def canceled
    change_status
  end
  
  def refunded
    change_status
  end

  private
    def change_status
      @attendee.status = action_name.to_sym
      @attendee.save!
      
      redirect_to(admin_attendees_url)
    end
    
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end
    
    def session_admin_order(new_order)
      session[:admin_attendee_order] ||= "Name"
      session[:admin_attendee_order] = new_order if new_order
    end
end
