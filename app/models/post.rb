class Post < ApplicationRecord
  belongs_to :user
  #mount_uploaders :images, ImageUploader
  #mount_uploader :image, ImageUploader
  mount_uploader :avatar, AvatarUploader

end
