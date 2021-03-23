class CommentsController < ApplicationController
    def new
      
      @comment = Comment.new
    end
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]
        @comment.save
        redirect_to post_path(@comment.post)
    end
end

private
    # Only allow a list of trusted parameters through.
    def comment_params
        params.require(:comment).permit(:author, :body)
    end