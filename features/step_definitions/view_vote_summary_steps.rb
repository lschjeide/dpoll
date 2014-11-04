And(/^event '(.*)' has the following votes$/) do |name, votes|
  # |Yes | No |
  event = Event.find_by_name(name)

  vote = votes.hashes.first

  create_votes event, vote, 'Yes'
  create_votes event, vote, 'No'
end

def create_votes event, vote, value
  num_votes = vote[value.downcase.to_sym].to_i

  num_votes.times {
    event.votes.push Vote.create!(vote: value)
  }
end

And(/^I view votes for '(.*)'$/) do |name|
  event = Event.find_by_name(name)
  visit "#/event/#{event.id}/results"
end

Then(/^I should see the following votes$/) do |expected_votes|
  rows = find("table").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_votes.diff!(table)
end