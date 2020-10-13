class Post < ApplicationRecord

  belongs_to :learner
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :notifications, dependent: :destroy

  attachment :image

  validates :title, presence: true
  validates :body, presence: true

  def favorited_by?(learner)
  	favorites.where(learner_id: learner.id).exists?
  end

  def create_notification_by(current_learner)
  	notification = current_learner.active_notifications.new(
  	  post_id: id,
  	  visited_id: learner_id,
      action: "favorite"
  	)
  	notification.save if notification.valid?
  end

  def create_notification_comment!(current_learner, comment_id)
  	# 自分以外にコメントしている人を全て取得し、全員に通知を送る
  	temp_ids = Comment.select(:learner_id).where(post_id: id).where.not(learner_id: current_learner.id).distinct
  	temp_ids.each do |temp_id|
  		save_notification_comment!(current_learner, comment_id, temp_id['learner_id'])
  	end
  	# まだ誰もコメントしていない場合、投稿者に通知を送る
  	save_notification_comment!(current_learner, comment_id, learner_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_learner, comment_id, visited_id)
  	# コメントは複数回することが考えられるため、1つの投稿に複数回通知する
  	notification = current_learner.active_notifications.new(
  	  post_id: id,
  	  comment_id: comment_id,
  	  visited_id: visited_id,
  	  action: "comment"
	)
    # 自分の投稿に対するコメントの場合、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


end
