class BlogIndexController < ApplicationController
  def index
    if params[:order] && params[:order] == "Latest"
      @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    elsif params[:order] && params[:order] == "Oldest"
      @posts = Post.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    elsif params[:order] && params[:order] == "Most Viewed"
      @posts = Post.order('views DESC').paginate(:page => params[:page], :per_page => 10)
    elsif params[:order] && params[:order] == "Least Viewed"
      @posts = Post.order('views ASC').paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.all.paginate(:page => params[:page], :per_page => 10)
    end
    banners_count = rand(1..3)
    i = 0
    @banner_idx = Array.new(banners_count)
    while (i < banners_count)
      @banner_idx[i] = rand(1..10)
      i+=1
    end
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
