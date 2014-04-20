class Topic < ActiveRecord::Base
	validates :name, length: {minimum: 1 }, presence: true 
	validates :description, length: {minimum: 1 }, presence: true
	has_many :posts, dependent: :destroy

	scope :visible_to, ->(user) { user ? scoped : where(public: true) }
end
