Then(/^I should not see description$/) do
  expect(page.has_selector?('.event-description-hdr')).to be false
end
