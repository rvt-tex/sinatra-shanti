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
        erb :'/users/show'
        #redirect "/posts"
    end 

    get '/login' do
        if is_logged_in?
          redirect "/posts"
        else
          erb :login
        end
    end
end 