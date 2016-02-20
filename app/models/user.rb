class User < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :nullify

  has_secure_password

  validates_presence_of( :first_name, :last_name, :password_confirmation)
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end
