class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	mount_uploader :avatar, ImageUploader
  has_many :images
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    def self.search email
    	User.where("email like ?", "%#{email}%")
    end
end