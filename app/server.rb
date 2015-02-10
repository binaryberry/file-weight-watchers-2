require 'json'
require 'rack-flash'
require 'rest_client'
require 'sinatra'
require 'sinatra/partial'

require_relative 'lib/user.rb'

class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, 'super secret'


	get '/' do
        erb :index
	end

	post '/data' do
		@user = User.new(params[:email], params[:password])
		@user.login
		response.set_cookie "workshare_cookie", "#{@user.my_cookie}"
		session[:email] = @user.email
		session[:password] = @user.password
	    redirect to '/data'
	end

	get '/data' do
		erb :data
	end

end