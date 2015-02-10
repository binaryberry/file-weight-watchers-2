require 'pry'
class FileList

	attr_accessor :files_metadata, :files_weight

	def initialize(metadata)
		@files_metadata = metadata
		@files_weight = 0
	end

	def total_weight
		@files_metadata["files"].each do |file_metadata|
			@files_weight += file_metadata["size"]
		end
		@files_weight
	end
end