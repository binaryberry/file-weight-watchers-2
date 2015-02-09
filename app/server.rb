require 'json'
require 'rack-flash'
require 'rest_client'
require 'sinatra'
require 'sinatra/partial'


class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, 'super secret'


	get '/' do
        erb :index
	end

	post '/data' do
		erb :data
	end
end