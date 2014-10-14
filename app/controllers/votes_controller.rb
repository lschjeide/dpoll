class VotesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    event = Event.find(params[:event_id])
    event.votes.push Vote.create! :vote => params[:vote]
    render :nothing => true, :status => 200
  end

  def index
    @event = Event.find(params[:event_id])
  end

end	