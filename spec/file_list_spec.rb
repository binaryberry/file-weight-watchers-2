require 'spec_helper'
require './app/lib/file_list.rb'
require 'pry'

describe 'file_list' do

  before(:each) {
  	@metadata = {"pagination"=>{"current_page"=>1, "total_pages"=>1, "total_entries"=>13}, "files"=>[{"id"=>14760603, "name"=>"test_powerpoint", "extension"=>"ppt", "version"=>1, "size"=>19, "created_at"=>"2015-02-12T23:10:16Z", "updated_at"=>"2015-02-12T23:10:21Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760603", "access_token"=>"TvWv1m_lOYabMLDF", "first_page_url"=>"https://my.workshare.com/images/icons/medium/ppt.png", "folder_id"=>1117472}, {"id"=>14760598, "name"=>"testssong", "extension"=>"mp3", "version"=>1, "size"=>14, "created_at"=>"2015-02-12T23:08:44Z", "updated_at"=>"2015-02-12T23:08:48Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760598", "access_token"=>"O-YjqBZ6jFCwlEEL", "first_page_url"=>"https://my.workshare.com/images/icons/medium/mp3.png", "folder_id"=>1117472}, {"id"=>14760597, "name"=>"test2", "extension"=>"bin", "version"=>1, "size"=>27, "created_at"=>"2015-02-12T23:08:38Z", "updated_at"=>"2015-02-12T23:08:39Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760597", "access_token"=>"Ej-lwZU_5Et2CCC1", "first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png", "folder_id"=>1117472}, {"id"=>14760596, "name"=>"test", "extension"=>"bin", "version"=>1, "size"=>22, "created_at"=>"2015-02-12T23:08:34Z", "updated_at"=>"2015-02-12T23:08:39Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760596", "access_token"=>"nIkXNcn9EIiCPQVz", "first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png", "folder_id"=>1117472}, {"id"=>14760595, "name"=>"song3", "extension"=>"mp3", "version"=>1, "size"=>9, "created_at"=>"2015-02-12T23:08:30Z", "updated_at"=>"2015-02-12T23:08:34Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760595", "access_token"=>"BCrlLv40zbh-Li0x", "first_page_url"=>"https://my.workshare.com/images/icons/medium/mp3.png", "folder_id"=>1117472}, {"id"=>14760594, "name"=>"song2", "extension"=>"mp3", "version"=>1, "size"=>9, "created_at"=>"2015-02-12T23:08:26Z", "updated_at"=>"2015-02-12T23:08:28Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760594", "access_token"=>"N8clHhCrfu-3mJS9", "first_page_url"=>"https://my.workshare.com/images/icons/medium/mp3.png", "folder_id"=>1117472}, {"id"=>14760590, "name"=>"New.Girl.S04E14.HDTV.x264-ASAP", "extension"=>"mp4", "version"=>1, "size"=>146253713, "created_at"=>"2015-02-12T23:05:29Z", "updated_at"=>"2015-02-12T23:29:01Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760590", "access_token"=>"k8mB68B2olJEIjzl", "first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png", "folder_id"=>1117472}, {"id"=>14760565, "name"=>"test", "extension"=>"txt", "version"=>1, "size"=>24, "created_at"=>"2015-02-12T22:47:09Z", "updated_at"=>"2015-02-12T22:47:11Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14760565", "access_token"=>"KkhMrZPPuQHdB5Bm", "first_page_url"=>"https://my.workshare.com/images/icons/medium/txt.png", "folder_id"=>1117472}, {"id"=>14726726, "name"=>"Copie de Reporting Janvier SNI - TS", "extension"=>"xlsx", "version"=>1, "size"=>745563, "created_at"=>"2015-02-10T23:52:15Z", "updated_at"=>"2015-02-10T23:53:38Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14726726", "access_token"=>"OnhRcxVV6Maw-jHl", "first_page_url"=>"https://my.workshare.com/images/icons/medium/xls.png", "folder_id"=>1117472}, {"id"=>14307204, "name"=>"frozen", "extension"=>"jpg", "version"=>1, "size"=>44235, "created_at"=>"2015-01-18T18:38:30Z", "updated_at"=>"2015-01-18T18:39:09Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14307204", "access_token"=>"2AM-A6UTzskGR5Gd", "first_page_url"=>"https://my.workshare.com/images/icons/medium/jpg.png", "folder_id"=>1117472}, {"id"=>14307197, "name"=>"javascriptvideo", "extension"=>"mov", "version"=>1, "size"=>132512010, "created_at"=>"2015-01-18T18:38:17Z", "updated_at"=>"2015-02-12T22:39:53Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14307197", "access_token"=>"pfXYakm4a1PDQS3q", "first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png", "folder_id"=>1117472}, {"id"=>14307202, "name"=>"README", "extension"=>"txt", "version"=>2, "size"=>11093, "created_at"=>"2015-01-18T18:38:12Z", "updated_at"=>"2015-02-10T23:52:18Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14307202", "access_token"=>"AlGalHjo-9hw-HV3", "first_page_url"=>"https://my.workshare.com/images/icons/medium/txt.png", "folder_id"=>1117472}, {"id"=>14307198, "name"=>"cat", "extension"=>"jpeg", "version"=>1, "size"=>9762, "created_at"=>"2015-01-18T18:38:05Z", "updated_at"=>"2015-01-18T18:38:28Z", "creator"=>{"name"=>"Tatiana Soukiassian", "email"=>"tatiana.soukiassian@gmail.com", "uuid"=>"f88a294c-8e2d-436c-a16d-70ce35df4aa3"}, "url"=>"https://my.workshare.com/decks/14307198", "access_token"=>"XRZXnK6ZNZBWl64v", "first_page_url"=>"https://my.workshare.com/images/icons/medium/jpg.png", "folder_id"=>1117472}]}
    @file_list = FileList.new(@metadata)
  }

  context "general" do

    it 'should be initialized with files metadata' do
      expect(@file_list.files_metadata).to eq @metadata
    end

    it 'should know the total weight of the files' do
      expect(@file_list.total_weight).to eq 279576.5
    end

    it "should know the gravity displacement of the files" do
      expect(@file_list.gravity_displacement).to eq 391157.5538
    end  
  end

  context "text files" do
    it 'should know the number of files for text files' do
      expect(@file_list.files_per_category["text_files"]).to eq 2
    end

    it 'should know the weight of files for text files' do
      expect(@file_list.weight_per_category["text_files"]).to eq 11.317
    end

  end

  context "video files" do

    it 'should know the number of files for video files' do
      expect(@file_list.files_per_category["video_files"]).to eq 2
    end

    it 'should know the weight of files for video files' do
      expect(@file_list.weight_per_category["video_files"]).to eq 390272.0122
    end

  end

  context "song files" do

    it 'should know the number of files for song files' do
      expect(@file_list.files_per_category["song_files"]).to eq 3
    end

    it 'should know the weight of files for song files' do
      expect(@file_list.weight_per_category["song_files"]).to eq 0.0384
    end

  end

  context "binary files" do

    it 'should know the number of files for binary files' do
      expect(@file_list.files_per_category["binary_files"]).to eq 2
    end

    it 'should know the weight of files for binary files' do
      expect(@file_list.weight_per_category["binary_files"]).to eq 0.049
    end

  end

  context "document files" do

    it 'should know the number of files for document files' do
      expect(@file_list.files_per_category["document_files"]).to eq 2
    end

    it 'should know the weight of files for document files' do
      expect(@file_list.weight_per_category["document_files"]).to eq 820.1402
    end

  end

  context "other files" do

    it 'should know the number of files for other files' do
      expect(@file_list.files_per_category["other_files"]).to eq 2
    end

    it 'should know the weight of files for other files' do
      expect(@file_list.weight_per_category["other_files"]).to eq 53.997
    end

  end


end