class Post < ApplicationRecord

  belongs_to :learner
  has_many :comments, dependent: :destroy

  attachment :image
end
