require 'pry'
class FileList

	attr_accessor :files_metadata, :files_weight_without_gravity, :files_weight_with_gravity, :files_per_category, :weight_per_category, :displacement

	def initialize(metadata)
		@files_metadata = metadata
		@files_weight_without_gravity = 0
		@categories = ["text_files", "video_files", "song_files", "document_files", "binary_files", "other_files"]
		@extensions = {"text_files" => ["txt"], "video_files" => ["avi", "mp4", "mov"], "song_files" => ["mp3"], "document_files" => ["doc", "xls", "ppt", "docx", "xlsx", "pptx"], "binary_files" =>["bin"], "other_files" => []}
		@files_per_category = {}
		@weight_per_category = {}
		@gravities = {"text_files" => 1, "video_files" => 1.4, "song_files"=> 1.2, "document_files"=> 1.1, "binary_files"=> 1, "other_files" => 1}
		get_category_data
		total_weight
		total_weight_without_gravity
	end

	def total_weight_without_gravity
		@files_metadata["files"].each do |file_metadata|
			@files_weight_without_gravity += file_metadata["size"]
		end
		@files_weight_without_gravity = format(@files_weight_without_gravity)
	end

	def total_weight
		@files_weight_with_gravity = 0
		@categories.each do |category|
			@files_weight_with_gravity += @weight_per_category[category]	
		end
		@files_weight_with_gravity
	end

	def gravity_displacement
		@displacement = @files_weight_with_gravity - @files_weight_without_gravity
	end
	
	def format number_in_bytes
		number_in_mb = number_in_bytes/1000000.0
		number_in_mb_rounded_up =(number_in_mb * 100).round.to_f / 100
	end


	def get_category_data
		@categories.each do |category|
			get_category_file_number(category)
			get_category_weight(category)
		end
	end

	def get_category_file_number(category)
		number = 0
		@files_metadata["files"].each do |file_metadata|
			if @extensions[category].include?(file_metadata["extension"]) 
				number +=1
			elsif category == "other_files" && @extensions.values.flatten.include?(file_metadata["extension"]) == false
				number +=1
			end
		end
		files_per_category[category] = number
	end

	def get_category_weight(category)
		weight = 0
		@files_metadata["files"].each do |file_metadata|
			if @extensions[category].include?(file_metadata["extension"]) 
				weight += file_metadata["size"] * @gravities[category]
				weight += 100 if category == "text_files"
			elsif category == "other_files" && @extensions.values.flatten.include?(file_metadata["extension"]) == false
				weight += file_metadata["size"] * @gravities[category] 
			end
		end
		@weight_per_category[category] = format(weight)
	end

end