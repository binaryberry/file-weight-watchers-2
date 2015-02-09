When(/^I login$/) do
    fill_in "email", with: "tatiana.soukiassian@gmail.com"
    fill_in 'password', with: "carrots"
    click_button 'Log in'
end
