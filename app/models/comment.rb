class Comment < ApplicationRecord

  belongs_to :learner
  belongs_to :post

  has_many :notifications, dependent: :destroy

  validates :comment, presence: true
end
