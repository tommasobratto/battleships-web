Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link('New Game')  
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content("What's your name?")
end

Given(/^I am on the player page$/) do
  visit('/player')
end

And(/^I don't type a "(.*?)"$/) do |name|
  fill_in 'name', :with => ''
end

When(/^I click on "(.*?)"$/) do |link|
  click_on(link)
end

Then(/^I should be "(.*?)"$/) do |arg1|
  page.should have_content("Please enter a name")
end

