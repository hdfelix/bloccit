class CommentsController < ApplicationController
  def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
  end

	def create
		@comment = current_user.comments.build(comment_params)
		@post = Post.find(params[:post_id])
		@comment.post = @post
		@topic = @post.topic
		authorize @comment
		
		if @comment.save
			redirect_to [@topic,@post], notice: "Comment from successfully added."
		else
			flash[:error] = "We could not save your comment."
			render :new
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
