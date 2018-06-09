class NotificationObserver < ActiveRecord::Observer

  def after_create(notification)
    puts "=" * 200
  end
end
