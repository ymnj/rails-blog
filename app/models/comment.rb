class Comment < ActiveRecord::Base

	validates :body, presence: true,
					 uniqueness: { scope: :post_id, message: "This comment has already been posted" }

end
