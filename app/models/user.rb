class User < ApplicationRecord
 has_many :posts
 has_secure_password
 mount_uploader :user_avatar, UserAvatarUploader

  validates :name, presence:true
  validates :lastname, presence: true
  validates :email,format:{ with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create } ,presence: true
  validates :password_digest, presence: true
end
