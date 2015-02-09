class User

	attr_accessor :email, :password, :my_cookie

	WORKSHARE_USER_SESSION_URL = 'https://my.workshare.com/api/v1.1/user_sessions.json'

	def initialize(email, password)
		@email = email
		@password = password
	end

	def login
		response = RestClient.post WORKSHARE_USER_SESSION_URL, {user_session:{email: @email, password: @password}, device:{app_uid: ENV['WORKSHARE_API_KEY']}}
		@my_cookie = response.cookies
	end


end