class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def create
		@event = Event.new(params[:event])

		if @event.save!
			redirect_to events_path, alert: 'Event created'
		else
			redirect_to events_path, alert: 'Failed to create event'
		end
	end

	private
end