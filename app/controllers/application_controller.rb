require './config/environment'
require 'securerandom'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shanti-shanti-shanti-sinatra-secure"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

end
