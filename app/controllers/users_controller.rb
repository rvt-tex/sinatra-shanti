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

end 