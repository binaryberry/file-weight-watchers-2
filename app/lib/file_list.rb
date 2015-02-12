require 'pry'
class FileList

	attr_accessor :files_metadata, :files_weight, :files_per_category, :weight_per_category

	def initialize(metadata)
		@files_metadata = metadata
		@files_weight = 0
		@categories = ["text_files"]
		@extensions = {"text_files" => ["jpg"]}
		@files_per_category = {}
		@weight_per_category = {}
		@gravities = {"text_files" => 1}
		get_category_data
	end

	def total_weight
		@files_metadata["files"].each do |file_metadata|
			@files_weight += file_metadata["size"]
		end
		@files_weight = format(@files_weight)
	end

	def format number_in_bytes
		number_in_bytes.to_s.reverse.gsub(/.{3}(?=.)/, '\0 ').reverse
		number_in_MB = number_in_bytes.to_f/1000
	end

	def get_category_data
		@categories.each do |category|
			get_file_number(category)
			get_category_weight(category)
		end
	end

	def get_file_number(category)
		number = 0
		@files_metadata["files"].each do |file_metadata|
			number +=1 if @extensions["#{category}"].include?(file_metadata["extension"]) 
		end
		files_per_category["#{category}"] = number
	end

	def get_category_weight(category)
		weight = 0
		@files_metadata["files"].each do |file_metadata|
			weight += file_metadata["size"] * @gravities["#{category}"] if @extensions["#{category}"].include?(file_metadata["extension"]) 
			weight += 100 if "#{category}" == "text_files"
		end
		@weight_per_category["#{category}"] = format(weight)
	end

end