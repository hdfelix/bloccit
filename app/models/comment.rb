class Comment < ActiveRecord::Base
  belongs_to :post
	belongs_to :user

	validates :body, length: { minimum: 2 }, presence: true

	after_create :send_favorite_emails

	private
	def send_favorite_emails
		self.post.favorites.each do |favorite|
			
			if favorite.user_id !=self.user.id && favorite.user.email_favorites?
				FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
			end
		end
	end
end
