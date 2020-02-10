class UsersController < ApplicationController

    get '/signup' do
        if !is_logged_in?
          erb :'/users/new'
        else
          redirect to "/posts"
        end
    end

    post '/signup' do
        @user = User.new(params)
        if @user.save
          session[:user_id] = @user.id
          redirect to '/users/:slug'
        else
          flash[:message] = "Please enter a valid username and email address to gain access."
          redirect to "/signup"
        end
    end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        #erb :'/users/show'
        redirect "/posts"
    end 

    get '/login' do
        if is_logged_in?
          redirect "/posts"
        else
          erb :login
        end
    end

    post '/login' do
        user = User.find_by(username:params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
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