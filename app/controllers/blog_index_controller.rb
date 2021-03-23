class BlogIndexController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end
  def about
    
  end
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    current_views = Integer(@post.read_attribute('views'))
    current_views+=1
    @post.update_attribute(:views, current_views)
    @comment = Comment.new
    @comment.post_id = @post.id
  end
  def contact

  end
end
