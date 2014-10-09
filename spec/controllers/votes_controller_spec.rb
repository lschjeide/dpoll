require 'rails_helper'

describe VotesController do
	describe '.new' do
		let(:event) {Event.create! {}}

		it 'renders new view' do
			get :new, :event_id => event.id
			expect(response.status).to eq 200
		end
			
		it 'populates event' do
      		get :new, :event_id => event.id
      		expect(assigns(:event)).to eq(event)			
		end	
	end	
end	