class Idea < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def join_for(user)
    joins.find_by_user_id(user.id) if user
  end


end
