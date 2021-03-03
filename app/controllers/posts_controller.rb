class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index 
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to :index
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :user_id)
    end

  
end
