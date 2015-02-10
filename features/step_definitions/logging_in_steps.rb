When(/^I login$/) do
    fill_in "email", with: "tatiana.soukiassian@gmail.com"
    fill_in 'password', with: "carrots"
    click_button 'Log in'
end

Then(/^I should see the weight of my files$/) do
  expect(page).to have_content "total weight"
end
