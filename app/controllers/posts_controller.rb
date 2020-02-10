class PostsController < ApplicationController

    get '/posts' do
        if is_logged_in?
          erb :'/posts/index'
        else
          flash[:message] = "You need to be logged in first to access this page."
          redirect to '/login'
        end
    end
end 