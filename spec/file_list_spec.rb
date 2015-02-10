require 'spec_helper'
require './app/lib/file_list.rb'
require 'pry'

describe 'file_list' do

  before(:each) {
  	@metadata = {"pagination"=>{"current_page"=>1, "total_pages"=>1, "total_entries"=>3},"files"=>[{"id"=>14307204,"name"=>"frozen","extension"=>"jpg","version"=>1,"size"=>44235,"created_at"=>"2015-01-18T18:38:30Z","updated_at"=>"2015-01-18T18:39:09Z","creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"},"url"=>"https://my.workshare.com/decks/14307204","access_token"=>"2AM-A6UTzskGR5Gd","first_page_url"=>"https://my.workshare.com/images/icons/medium/jpg.png","folder_id"=>1117472},{"id"=>14307202,"name"=>"README","extension"=>"md","version"=>1,"size"=>11093,"created_at"=>"2015-01-18T18:38:12Z","updated_at"=>"2015-01-18T18:38:15Z","creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"},"url"=>"https://my.workshare.com/decks/14307202","access_token"=>"AlGalHjo-9hw-HV3","first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png","folder_id"=>1117472},{"id"=>14307198,"name"=>"cat","extension"=>"jpeg","version"=>1,"size"=>9762,"created_at"=>"2015-01-18T18:38:05Z","updated_at"=>"2015-01-18T18:38:28Z","creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"},"url"=>"https://my.workshare.com/decks/14307198","access_token"=>"XRZXnK6ZNZBWl64v","first_page_url"=>"https://my.workshare.com/images/icons/medium/jpg.png","folder_id"=>1117472}]}
    @file_list = FileList.new(@metadata)
  }

  it 'should be initialized with files metadata' do
    expect(@file_list.files_metadata).to eq @metadata
  end

  it 'should know the total weight of the files' do
    expect(@file_list.total_weight).to eq 65090
  end

end