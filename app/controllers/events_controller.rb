class EventsController < ApplicationController
  def index
    @events = Event.all    
  end

  def new
    @event = Event.new
  end

  def create
  	@venue = Venue.new(:full_address params[:venue])
    @event = Article.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  def edit
  	@event = Event.find(params[:id])
  	@category_event = Category.find(@event.category)
  	@venue_event = Venue.find(@event.venue)
  end

   def update
      if @event.update(event_params)
        format.html { redirect_to @event }
      else
        format.html { render :edit }
      end
  end
  private
  	def event_params
      params.require(:event).permit(:name, :hero_image_url, :venue, :category, :starts_at, :ends_at, :extended_html_description)
 	end

end
