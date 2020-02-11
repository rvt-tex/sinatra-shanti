class UsersController < ApplicationController

    get '/signup' do
        if !is_logged_in?
          erb :'/users/new'
        else
          redirect to "/posts"
        end
    end

    post '/signup' do
        current_user = User.new(params)
        if current_user.save
          session[:user_id] = current_user.id
          redirect to "/users/#{current_user.id}"
        else
          flash[:message] = "Please enter a valid username and email address to gain access."
          redirect to "/signup"
        end
    end

    get '/users/:id' do
        current_user
        erb :'/users/show'
    end 

    get '/login' do
        if is_logged_in?
          redirect "/posts"
        else
          erb :login
        end
    end

    post '/login' do
        current_user = User.find_by(username:params[:username])
        if current_user && current_user.authenticate(params[:password])
          session[:user_id] = current_user.id
          redirect "/posts"
        else
          flash[:message] = "Please enter valid login information to gain access, your username or password did not match.
                              Please Try Again."
          redirect "/login"
        end
    end 

    get '/logout' do
        if is_logged_in?
          session.clear
          redirect to '/'
        else
          redirect to '/login'
        end
    end
    
end 