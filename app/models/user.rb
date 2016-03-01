class User < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :nullify

  has_many :favorites, dependent: :nullify
  has_many :favorited_posts, through: :favorites, source: :favorite




  has_secure_password

  validates :password, length: { minimum: 7 }, allow_nil: true

  validates_presence_of( :first_name, :last_name)
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }



end
