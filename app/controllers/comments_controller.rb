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
			redirect_to [@topic,@post]
		end
	end

	def destroy
		@topic = Topic.find(params[:topic_id])
		@post = @topic.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		authorize(@comment)
		if @comment.destroy
			flash[:notice] = "Comment was removed."
			redirect_to [@topic, @post]
		else
			flash[:error] = "Comment couldn't be deleted. Try again."
			redirect_to [@topic, @post]
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
