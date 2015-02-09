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

end