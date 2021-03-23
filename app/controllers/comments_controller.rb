class CommentsController < ApplicationController
    def new
      @post = Post.find(params[:id])
      @comments = Comment.where(pID: params[:id])
      current_views = Integer(@post.read_attribute('views'))
      current_views+=1
      @post.update_attribute(:views, current_views)
      
      @comment = Comment.new
    end
    def create
        @comment = Comment.new(post_params)
        @comment.pID = @post.read_attribute(:id)
        respond_to do |format|
            if @comment.save
                format.html { redirect_to @post, notice: "Post was successfully created." }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end
end

private
    # Only allow a list of trusted parameters through.
    def post_params
        params.permit(:author, :body)
    end