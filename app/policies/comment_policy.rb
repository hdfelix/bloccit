class CommentPolicy < ApplicationPolicy	
	
	def show?
		true
	end
	
	def create?
		user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
	end
end
