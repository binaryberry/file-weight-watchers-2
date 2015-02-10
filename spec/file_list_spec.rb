require 'spec_helper'
require './app/lib/file_list.rb'
require 'pry'

describe 'file_list' do

  before(:each) {
  	@metadata = "test_metadata"
    @file_list = FileList.new(@metadata)
  }

  it 'should be initialized with files metadata' do
    expect(@file_list.files_metadata).to eq @metadata
  end

end