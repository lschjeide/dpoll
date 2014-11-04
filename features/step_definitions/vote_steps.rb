
Given(/^I go to vote for '(.*)'$/) do |name|
  event = Event.find_by_name(name)
  visit "#/event/#{event.id}/vote/booth"
end

When(/^I vote '(.*)'$/) do |vote|
  if vote == "Yes"
  	click_button("Yes")
  else
  	click_button("No")
  end
end

Then(/^I should be thanked for my feedback$/) do
   expect(page.find('.poll_response')).to have_content "Thank you for your feedback!"
end

Then(/^there should be (\d+) '(.*)' vote for event '(.*)'$/) do |num, vote, name|
  event = Event.find_by_name(name)
  if vote == "Yes"
  	expect(event.num_yeses).to eq num.to_i
  else
  	expect(event.num_nos).to eq num.to_i
  end
end

Then(/^I should be thanked remorsefully for my feedback$/) do
   expect(page.find('.poll_response')).to have_content "I'm sorry this wasn't worth your time. Thank you for your feedback anyway!"
end
