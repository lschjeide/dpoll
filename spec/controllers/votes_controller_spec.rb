require 'rails_helper'

describe VotesController do

  let(:event) { Event.create! {} }

  describe '.new' do
    it 'renders new view' do
      get :new, event_id: event.id
      expect(response.status).to eql 200
    end

    it 'populates event' do
      get :new, event_id: event.id
      expect(assigns(:event)).to eq(event)
    end
  end

  describe '.create' do
    it 'creates success response' do
      post :create, event_id: event.id
      expect(response.status).to eql 200
    end

    it 'creates new vote' do
      post :create, event_id: event.id, vote: 'Yes'

      expect(event.votes.count).to eql 1
      expect(event.votes.first.vote).to eql 'Yes'
    end
  end

end
