class Learner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # フォロー機能
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following_learner, through: :follower, source: :followed
  has_many :follower_learner, through: :followed, source: :follower
  # //

  attachment :profile_image

  validates :nickname, presence: true
  validates :country, presence: true
  validates :learning, presence: true
  validates :native, presence: true

  enum learning: { Japanese: 0, English: 1, Spanish: 2, German: 3, French: 4, Italian: 5 }
  # enum native: { japanese: 0, english: 1, spanish: 2, german: 3, french: 4, italian: 5 }

  def follow(learner_id)
    follower.create(followed_id: learner_id)
  end

  def unfollow(learner_id)
    follower.find_by(followed_id: learner_id).destroy
  end

  def following?(learner)
    following_learner.include?(learner)
  end

end
