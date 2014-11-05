def click_event_button(name, button)
  rows = all('.event-row')
  rows.each do |row|
    event_name = row.find('.event-name').text.strip
    if event_name == name
      row.find(button).click
      break
    end
  end
end
