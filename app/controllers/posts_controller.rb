class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index 
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    

    if @post.save
      @posts = Post.all
      render :index
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :user_id)
    end

  
end
