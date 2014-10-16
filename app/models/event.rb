class Event < ActiveRecord::Base
  has_many :votes, dependent: :destroy

  attr_accessible :name, :description, :event_date, :votes, :pretty_event_date

  def pretty_event_date
    if event_date
  	 event_date.strftime("%Y-%m-%d")
    end
  end

  def pretty_event_date=(new_value)
  	self.event_date = new_value
  end

  def num_yeses
    votes.select { |v| 'Yes'.eql?(v.vote) }.count
  end

  def num_nos
    votes.select { |v| 'No'.eql?(v.vote) }.count
  end
end