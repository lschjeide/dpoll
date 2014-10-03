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

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      redirect_to events_path, alert: 'Event deleted'
    else
      redirect_to events_path, alert: 'Failed to delete event'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(name: params[:name], description: params[:description])
      redirect_to events_path, alert: 'Event updated'
    else
      redirect_to events_path, alert: 'Failed to update event'
    end

  end


  private
end