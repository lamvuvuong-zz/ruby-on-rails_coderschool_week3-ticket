class EventsController < ApplicationController
  def index
    @events = Event.all    
  end

  def new
    @event = Event.new
  end

  def create
  	@event = Event.new(event_params)
    
    if @event.save
        @user_event = UserEvent.new(user_id: current_user.id, event_id: @event.id)
        @user_event.save
      redirect_to root_path

    else
      redirect_to action: :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  def edit
  	@event = Event.find(params[:id])
  	@category_event = Category.find(@event.category)
  	@venues = Venue.all
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event }
      else
        format.html { render :edit }
      end
    end
  end
  private
  	def event_params
      params.require(:event).permit(:name, :starts_at, :ends_at, :hero_image_url, :extended_html_description, :category_id, :venue_id)
   	end

end
