class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :tags
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def to_s
    user_name
  end
end