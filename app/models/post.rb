class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, pressence: true
  validates :body, presence: true
end
