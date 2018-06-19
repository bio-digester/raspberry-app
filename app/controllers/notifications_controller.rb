class NotificationsController < ApplicationController
before_action :set_notification
  def to_view
    @notification.update_attribute(:visualized, true)
    if @notification.message == "O usuário irá remover o biogás da câmara de gás !"
      system "rake message:send_socket_message"
    end
  end

private
  def set_notification
    @notification = Notification.find(params[:id])
  end

end
