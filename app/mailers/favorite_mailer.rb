class FavoriteMailer < ActionMailer::Base
	default from: "hector.felix@bfa.org"

	def new_comment(user, post, comment)
		@user = user
		@post = post
		@comment = comment

		headers["Message-ID"] = "<comments/#{@comment.id}@hdfelix-bloccit>"
		headers["In-Reply-To"] = "<post/#{@post.id}@hdfelix-bloccit>"
		headers["References"] = "<post/#{@post.id}@hdfelix-bloccit>"

		mail(to: user.email, subject: "New comment on #{post.title}")
	end
end
