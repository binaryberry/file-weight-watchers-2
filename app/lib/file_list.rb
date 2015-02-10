require 'pry'
class FileList

	attr_accessor :files_metadata

	def initialize(metadata)
		@files_metadata = metadata
	end
end