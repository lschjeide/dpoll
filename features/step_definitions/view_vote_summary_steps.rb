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
  # |Yes | No |

  actual_votes = [expected_votes.raw.first]

  actual_yeses = find('#yes-votes').text.strip
  actual_nos = find('#no-votes').text.strip

  actual_votes.push([actual_yeses, actual_nos])

  expected_votes.diff! actual_votes
end