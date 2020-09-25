class Learner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  attachment :profile_image

  enum learning: { Japanese: 0, English: 1, Spanish: 2, German: 3, French: 4, Italian: 5 }
  # enum native: { japanese: 0, english: 1, spanish: 2, german: 3, french: 4, italian: 5 }
end
