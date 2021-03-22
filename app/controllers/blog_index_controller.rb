class BlogIndexController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(pID: params[:id])
    current_views = Integer(@post.read_attribute('views'))
    current_views+=1
    @post.update_attribute(:views, current_views)
  end
  def about
    
  end
  def new
    @post = Post.new
  end
  def create
    
  end
  def contact

  end
end
