class Event < ActiveRecord::Base

	attr_accessible :name, :description, :event_date
end