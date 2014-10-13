class VotesController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
	end
	
	def create
      render :nothing => true, :status => 200
	end	

end	