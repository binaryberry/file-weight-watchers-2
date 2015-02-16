When(/^I login$/) do
    fill_in "email", with: "tatiana.soukiassian@gmail.com"
    fill_in 'password', with: "carrots"
    click_button 'Log in'
end

Then(/^I should see the weight of my files$/) do
  expect(page).to have_content "total weight"
end

Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should be on the file_list page$/) do
  visit '/file_list'
end

Then(/^I should see "(.*?)"$/) do |arg1|
	expect(page).to have_content arg1
end

