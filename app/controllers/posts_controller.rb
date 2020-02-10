class PostsController < ApplicationController

    get '/posts' do
        if is_logged_in?
          erb :'/posts/index'
        else
          flash[:message] = "You need to be logged in first to access this page."
          redirect to '/login'
        end
    end

    get '/posts/new' do
        if is_logged_in?
          erb :'/posts/new'
        else
          flash[:message] = "You need to be logged in first to access this page."
          redirect to "/login"
        end
    end

    post '/posts' do
        if is_logged_in?
          post = Post.new(params)
          post.user = current_user
          if post.save
            flash[:message] = "Congrats! Love Your Thought"
            redirect to "/posts"
          else
            flash[:message] = "Please share your thoughts, we would love to hear them."
            redirect to "/posts/new"
          end
        else
          flash[:message] = "You need to be logged in first to access this page."
          redirect to "/login"
        end
    end

end 