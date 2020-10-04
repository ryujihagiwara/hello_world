class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "Learner"
  belongs_to :followed, class_name: "Learner"

end
