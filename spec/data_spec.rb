require 'spec_helper'
require './app/lib/data.rb'
require 'pry'

describe 'data' do

  before(:each) {
    @data = Data.new(metadata)
  }

end