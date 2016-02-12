class Comment < ActiveRecord::Base

	# Comments belong to a post
	belongs_to :post


	# The scope will make sure that only unique comment body per post
	validates :body, presence: true,
					 uniqueness: { scope: :post_id, message: "This comment has already been posted" }

end
