require 'rails_helper'

describe VotesController do
  describe '.new' do
    let(:event) { Event.create! {} }

    it 'renders new view' do
      get :new, event_id: event.id
      expect(response.status).to eql 200
    end

    it 'populates event' do
      get :new, event_id: event.id
      expect(assigns(:event)).to eq(event)
    end

    it 'creates vote for an event' do
      post :create, event_id: event.id
      expect(response.status).to eql 200
    end
  end
end	