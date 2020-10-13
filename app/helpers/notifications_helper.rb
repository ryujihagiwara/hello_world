module NotificationsHelper

  def notification_form(notification)
  	@visiter = link_to notification.visiter.nickname, notification.visiter, style: "font-weight: bold; color: orange;"
  	@comment = nil
  	@your_post = link_to 'your post', notification.post, style: "font-weight: bold; color: orange;"
  	@visiter_comment = notification.comment_id
  	# notification.actionがfollowかfavoriteかcommentか
  	case notification.action
  	  when 'follow' then
  	  	"#{@visiter} " " followed you"
  	  when 'favorite' then
  	    "#{@visiter} good to #{@your_post}"
  	  when 'comment' then
  	  	@comment = Comment.find_by(id: notification.comment_id)&.comment
  	  	"#{@visiter} " " commented " " to #{@your_post}"
    end
  end

  def unchecked_notifications
  	@notifications = current_learner.passive_notifications.where(checked: false)
  end

end
