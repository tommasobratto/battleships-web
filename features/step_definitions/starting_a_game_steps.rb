Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link('New Game')  
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content("What's your name?")
end