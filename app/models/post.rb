class Post < ApplicationRecord

  belongs_to :learner
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

  validates :title, presence: true
  validates :body, presence: true

  def favorited_by?(learner)
  	favorites.where(learner_id: learner.id).exists?
  end
end
