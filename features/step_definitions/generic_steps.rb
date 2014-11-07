def find_a_button(name)
  begin
    return find_button(name)
  rescue
  end

  begin
    return find_link(name)
  rescue
  end

  begin
    return find(".#{label_to_class(name)}")
  rescue
  end

  find(".#{name.downcase.split.first}")
end

When(/^I pause$/) do
  print 'Press Return to continue ...'
  STDIN.getc
end

When(/^I wait a moment$/) do

  sleep(1)
end

When(/^I am not logged in$/) do
  visit('/users/sign_out') # ensure that at least
end

When(/^I am logged in$/) do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(email: email, password: password, password_confirmation: password).save!

  visit '/users/sign_in'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'Log in'
end
