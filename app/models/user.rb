class User < ApplicationRecord
  has_secure_password
  mount_uploader :profile_photo, ProfilePhotoUploader

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :profile_photo, presence: true

  def downcase_email
    self.email = email.downcase
  end
end
