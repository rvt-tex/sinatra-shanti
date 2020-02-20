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

  get '/' do
    if !is_logged_in?
      erb :index
    else
      redirect "/posts"
    end
  end
    
  helpers do
    def is_logged_in?
      !!session[:user_id]
    end
    
    def current_user
      User.find(session[:user_id])
    end
  end
end
