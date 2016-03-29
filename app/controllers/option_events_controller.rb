class OptionEventsController < ApplicationController
	def new
		@option_event = OptionEvent.new(checked: params[:event_id], event: params[:event_id])
		@option_event.save
		redirect_to users_show_path
	end
end
