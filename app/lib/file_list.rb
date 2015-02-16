require 'pry'
class FileList

	attr_accessor :files_metadata, :files_weight_without_gravity, :files_weight_with_gravity, :data_per_category, :displacement

	def initialize(metadata)
		@files_metadata = metadata
		@data_per_category = {}
		@categories = {"text_files" => {"extensions" => ["txt"], "gravities" => 1},"video_files" => {"extensions" => ["avi", "mp4", "mov"], "gravities" => 1.4}, "song_files" => {"extensions" => ["mp3"], "gravities" => 1.2},"document_files" => {"extensions" => ["doc", "xls", "ppt", "docx", "xlsx", "pptx"], "gravities" => 1.1},"binary_files" => {"extensions" => ["bin"], "gravities" => 1},"other_files" => {"extensions" => [], "gravities" => 1}}
		list_main_extensions
		get_data
	end

	def get_data
		@categories.each {|category, attributes| get_category_data(category)}
		total_weight
		total_weight_without_gravity
	end

	def get_category_data(category)
		@number = 0
		@weight = 0
		@files_metadata["files"].each do |file_metadata|
			add_file(file_metadata, category) if @categories[category]["extensions"].include?(file_metadata["extension"]) || (category == "other_files" && @main_extensions.include?(file_metadata["extension"]) == false)
		end
		@data_per_category[category] = {"file_number" => @number, "files_weight" => format(@weight)}
	end

	def list_main_extensions
		@main_extensions = []
		@categories.values.each {|category_data| @main_extensions << category_data["extensions"]}
		@main_extensions.flatten!
	end

	def add_file(file_metadata, category)
		@number +=1
		@weight += file_metadata["size"] * @categories[category]["gravities"]
		@weight += 100 if category == "text_files"
	end
	
	def format number_in_bytes
		number_in_mb = number_in_bytes/1000000.0
		number_in_mb_rounded_up =(number_in_mb * 100).round.to_f / 100
	end
	
	def total_weight
		@files_weight_with_gravity = 0
		@categories.each {|category, category_data| @files_weight_with_gravity += @data_per_category[category]["files_weight"]}
		@files_weight_with_gravity
	end
	
	def total_weight_without_gravity
		@files_weight_without_gravity = 0
		@files_metadata["files"].each {|file_metadata| @files_weight_without_gravity += file_metadata["size"]}
		@files_weight_without_gravity = format(@files_weight_without_gravity)
	end

	def gravity_displacement
		@displacement = @files_weight_with_gravity - @files_weight_without_gravity
	end
	
end