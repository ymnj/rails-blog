class Post < ActiveRecord::Base

  # Friendly_id
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

	# Creates a relationship to comments. If a post is deleted, so will it's comments
  belongs_to :category
  belongs_to :user

	has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites


	validates :title, presence: true,
					 uniqueness: true									

  def favorited_by?(user)
    favorites.find_by_user_id(user.id).present?
  end

  def favorite_for(user)
    favorites.find_by_user_id user
  end


end

