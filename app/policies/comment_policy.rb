class CommentPolicy < ApplicationPolicy	
	
	def show?
		true
	end

	def create?
		user.present? && user.role?(:admin)
	end
end
