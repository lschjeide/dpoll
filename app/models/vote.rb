class Vote < ActiveRecord::Base
  belongs_to :event
	attr_accessible :vote
end