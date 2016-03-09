class PostFavoritedJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    # Get all the post comments by last 24 hours.
    @comments = Comment.where(["created_at > ?", 2.days.ago])
    
    # Find user that comments belong to. 
  end
end
