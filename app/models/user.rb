class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { 
    medium: "300x300>", 
    thumb: "100x100>" 
  }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :posts
  has_many :users
  has_many :followers

  before_save :set_nick_name

  def followers_count
    Follower.where(follow_id: nick_name).count
  end

  def subscrition_count
    Follower.where(user_id: id).count
  end

  private

  def set_nick_name
    unless self.nick_name.present?
      self.nick_name = Date.today
    end
  end
end
