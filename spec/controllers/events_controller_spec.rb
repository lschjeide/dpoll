#require 'spec_helper'
require 'rails_helper'

describe EventsController do

	let(:valid_attributes) { { name: "some name", description:'some description' } }

   describe ".index" do
    it "shows all events" do
      event = Event.create! valid_attributes
      get :index, {}
      expect(assigns(:events)).to eq([event])
    end
  end


	describe ".create" do
		it "creates an event" do
			expect {
	          post :create, {:event => valid_attributes}
	        }.to change(Event, :count).by(1)
		end
		it "assigns a newly created event as @event" do
	        post :create, {:event => valid_attributes}
	        expect(assigns(:event)).to be_a(Event)
	        expect(assigns(:event)).to be_persisted
	    end

	    it "redirects to the events page" do
	        post :create, {:event => valid_attributes}
	        expect(response).to redirect_to(:events)
	    end
	end

end