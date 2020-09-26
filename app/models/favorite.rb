class Favorite < ApplicationRecord

  belongs_to :learner
  belongs_to :post
end
