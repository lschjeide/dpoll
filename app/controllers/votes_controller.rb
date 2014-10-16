class VotesController < ApplicationController
  respond_to :json
  skip_before_filter  :verify_authenticity_token

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    event = Event.find(params[:event_id])
    vote = Vote.new :vote => params[:vote]
    event.votes.push vote
    if event.save!
      render json: vote
    else
      render json:{errors:['Failed to add vote']}, status:422
    end
  end

end	