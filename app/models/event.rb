class Event < ActiveRecord::Base
  has_many :votes, dependent: :destroy

  attr_accessible :name, :description, :event_date, :votes

  def num_yeses
    votes.select { |v| 'Yes'.eql?(v.vote) }.count
  end

  def num_nos
    votes.select { |v| 'No'.eql?(v.vote) }.count
  end
end