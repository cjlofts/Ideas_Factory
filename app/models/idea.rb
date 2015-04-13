class Idea < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def user # this would be a work around if not all posts were written by a 'user'
    if user_id
      User.find_by(id: user_id)
    else
      User.new(first_name: "No user available", last_name: "")
    end
  end
  
end
