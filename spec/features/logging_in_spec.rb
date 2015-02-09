require 'spec_helper'

feature "User logs in with his workshare credentials" do
	scenario "when on the homepage" do
		visit '/'
		fill_in 'email', with: "tatiana.soukiassian@gmail.com"
		fill_in 'password', with: "carrots"
		click_button 'Log in'
		expect(page).to have_content("You are logged in as tatiana.soukiassian@gmail.com")
		expect(current_path).to eq("/files")
	end

end
