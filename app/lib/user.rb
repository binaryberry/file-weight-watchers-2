require 'pry'
class User

	attr_accessor :email, :password, :my_cookie

	WORKSHARE_USER_SESSION_API_URL = 'https://my.workshare.com/api/v1.1/user_sessions.json'
	WORKSHARE_FILES_DATA_API_URL = 'https://my.workshare.com/api/open-v1.0/files.json'


	def initialize(email, password)
		@email = email
		@password = password
	end

	def login
		response = RestClient.post WORKSHARE_USER_SESSION_API_URL, {user_session:{email: @email, password: @password}, device:{app_uid: ENV['WORKSHARE_API_KEY']}}
		@my_cookie = response.cookies
	end

	def listfiles(my_cookie)
		files_metadata_string = RestClient.get WORKSHARE_FILES_DATA_API_URL, {cookies: my_cookie}
		@files_metadata	= JSON.parse(files_metadata_string)	
	end


end