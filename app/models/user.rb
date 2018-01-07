class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  
  validates_presence_of :name

  has_many :comments, dependent: :restrict_with_error
  has_many :commented_restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurant, through: :favorites, source: :restaurant

  def admin?
    self.role == "admin"
  end
end
