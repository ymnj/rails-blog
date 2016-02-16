class Post < ActiveRecord::Base

	# Creates a relationship to comments. If a post is deleted, so will it's comments
	has_many :comments, dependent: :destroy
  belongs_to :category



	validates :title, presence: true,
					 uniqueness: true									

end

