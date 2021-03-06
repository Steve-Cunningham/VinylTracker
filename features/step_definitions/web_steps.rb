Given(/^the user '(.*?)' with password '(.*)'$/) do |email, password|
  user = User.create( email: email, password: password)
  refute user.new_record?, user.errors.full_messages.join(".")
end

When(/^I go to the homepage$/) do
  visit "/"
end

When "I open the page" do
  save_and_open_page
end

When(/^I (?:click|press) "(.*?)"$/) do |text|
  click_link_or_button text
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |value, field_named|
  fill_in field_named, with: value
end

When (/^(?:|I )choose "([^"]*)"$/) do |field|
  choose(field)
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content(content)
end


When(/^I go to the index page$/) do
  visit('/albums')
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_link arg1
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

Then(/^I select "(.*?)" from "(.*?)"$/) do |arg1, arg2|
  select(arg1, :from => arg2)
end