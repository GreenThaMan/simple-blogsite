class CommentsController < ApplicationController
    def new
      @comment = Comment.new
    end
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]
        @comment.save
        post_temp = Post.find(params[:post_id])
        c_count = post_temp.comments + 1
        post_temp.comments = c_count
        post_temp.save
        redirect_to post_path(@comment.post)
    end
end

private
    # Only allow a list of trusted parameters through.
    def comment_params
        params.require(:comment).permit(:author, :body)
    end