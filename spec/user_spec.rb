require 'spec_helper'
require './app/lib/user.rb'

describe 'user' do

  it 'should be initialized with an email and password' do
    user = User.new("tatiana.soukiassian@gmail.com", "carrots")
    expect(user.email).to eq "tatiana.soukiassian@gmail.com"
    expect(user.password).to eq "carrots"
  end

end