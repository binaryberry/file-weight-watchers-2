require 'spec_helper'
require './app/lib/user.rb'
require 'pry'

describe 'user' do

  before(:each) {
    @user = User.new("tatiana.soukiassian@gmail.com", "carrots")
  }

  it 'should be initialized with an email and password' do
    expect(@user.email).to eq "tatiana.soukiassian@gmail.com"
    expect(@user.password).to eq "carrots"
  end

  it 'should allow to login' do
  	@user.login
  	session_id = @user.my_cookie["my_session_id"]
  	expect(session_id.length).to be >= 32
  end

  it 'should have the list of files of that user' do 
    @user.login
    expect(@user.listfiles(@user.my_cookie)).to eq({"pagination"=>{"current_page"=>1, "total_pages"=>1, "total_entries"=>4}, "files"=>[{"id"=>14726726, "name"=>"Copie de Reporting Janvier SNI - TS", "extension"=>"xlsx", "version"=>1, "size"=>745563, "created_at"=>"2015-02-10T23:52:15Z", "updated_at"=>"2015-02-10T23:53:38Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14726726", "access_token"=>"OnhRcxVV6Maw-jHl", "first_page_url"=>"https://my.workshare.com/images/icons/medium/xls.png", "folder_id"=>1117472}, {"id"=>14307204, "name"=>"frozen", "extension"=>"jpg", "version"=>1, "size"=>44235, "created_at"=>"2015-01-18T18:38:30Z", "updated_at"=>"2015-01-18T18:39:09Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14307204", "access_token"=>"2AM-A6UTzskGR5Gd", "first_page_url"=>"https://my.workshare.com/images/icons/medium/jpg.png", "folder_id"=>1117472}, {"id"=>14307202, "name"=>"README", "extension"=>"txt", "version"=>2, "size"=>11093, "created_at"=>"2015-01-18T18:38:12Z", "updated_at"=>"2015-02-10T23:52:18Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14307202", "access_token"=>"AlGalHjo-9hw-HV3", "first_page_url"=>"https://my.workshare.com/images/icons/medium/txt.png", "folder_id"=>1117472}, {"id"=>14307198, "name"=>"cat", "extension"=>"jpeg", "version"=>1, "size"=>9762, "created_at"=>"2015-01-18T18:38:05Z", "updated_at"=>"2015-01-18T18:38:28Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14307198", "access_token"=>"XRZXnK6ZNZBWl64v", "first_page_url"=>"https://my.workshare.com/images/icons/medium/jpg.png", "folder_id"=>1117472}]})
  end

end