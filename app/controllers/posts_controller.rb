class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index 
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  
end
