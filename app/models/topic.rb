class Topic < ActiveRecord::Base
	validates :name, length: {minimum: 1 }, presence: true 
	validates :description, length: {minimum: 1 }, presence: true
	has_many :posts
end
