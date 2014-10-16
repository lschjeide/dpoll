#require 'spec_helper'
require 'rails_helper'

describe EventsController do

	let(:valid_attributes) { { name: "some name", description:'some description' } }
  let(:event) { Event.create! {} }

   describe ".index" do
    it "shows all events" do
      event = Event.create! valid_attributes
      get :index, format: :json
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
	end

  describe ".delete" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}
      }.to change(Event, :count).by(-1)
    end
  end

  describe ".update" do
    it "changes stuff" do
      event = Event.create! valid_attributes
      put :update, :id => event.id, :event => {name: "some new name", description:'some different description'}
      event.reload
      expect(event.name).to eq('some new name')
      expect(event.description).to eq('some different description')
    end
  end

  describe '.results' do
    it 'renders index view' do
      get :results, {:id => event.id}
      expect(response.status).to eql 200
    end

    it 'populates event' do
      get :results, {:id => event.id}
      expect(assigns(:event)).to eq(event)
    end

  end

end