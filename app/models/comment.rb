class Comment < ApplicationRecord

  belongs_to :learner
  belongs_to :post
end
