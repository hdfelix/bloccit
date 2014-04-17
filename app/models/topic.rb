class Topic < ActiveRecord::Base
	validates :title, length: {minimum: 1 }, presence: true 
	validates :description, length: {minimum: 1 }, presence: true
	has_many :posts
end
