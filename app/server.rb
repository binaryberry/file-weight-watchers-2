require 'sinatra'
require 'json'
require 'rest_client'
require 'sinatra/partial'
require 'rack-flash'
require 'json'


class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, 'super secret'


	get '/' do
	  "Hello monde"
	end


end