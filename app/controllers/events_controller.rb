class EventsController < ApplicationController
  before_filter :check_auth!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    @events = Event.all
    respond_with @events
  end

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @event.as_json(methods: :pretty_event_date) }
    end
  end

  def create
    @event = Event.new(params[:event])

    if @event.save!
      render json: @event
    else
      render json: { errors: ['Failed to create event'] }, status: 422
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      render json: @event
    else
      render json: { errors: ['Failed to update event'] }, status: 422
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.delete
      render json: { success: 'Event deleted' }, status: 200
    else
      render json: { errors: ['Failed to delete event'] }, status: 422
    end
  end

  def results
    @event = Event.find(params[:id])
    render json: @event.as_json(methods: [:num_yeses, :num_nos])
  end

  private

  def check_auth!
    render json: { errors: ['User not Authorized'] }, status: 403 unless user_signed_in?
  end
end
