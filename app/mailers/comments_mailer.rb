class CommentsMailer < ApplicationMailer

  def notify_post_owner(comment)
    @user = comment.user
    @post = comment.post
    @comment = comment
    mail(to: @post.user.email, subject: "#{@user.full_name} commented on your post")
  end
end
