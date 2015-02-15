require 'json'
require 'rack-flash'
require 'rest_client'
require 'sinatra'
require 'sinatra/partial'

require_relative 'lib/user.rb'
require_relative 'lib/file_list.rb'

class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, 'super secret'
	set :public_folder, '../public'

	get '/' do
        erb :index
	end

	post '/file_list' do
		@user = User.new(params[:email], params[:password])
		@user.login
		response.set_cookie "workshare_cookie", "#{@user.my_cookie}"
		session[:email] = @user.email
		session[:password] = @user.password
	    redirect to '/file_list'
	end

	get '/file_list' do
		@user = User.new(session[:email], session[:password])
		@user.login
		my_cookie = eval(request.cookies["workshare_cookie"])
		files_metadata = @user.listfiles(my_cookie)
		@file_list = FileList.new(files_metadata)
		erb :file_list
	end
end