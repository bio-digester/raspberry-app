class NotificationsController < ApplicationController
before_action :set_notification
  def to_view
    @notification.update_attribute(:visualized, true)
    if @notification.message == "[ALERT] O biogás está pronto para ser retirado" || @notification.message == "[DANGER] Retire urgentemente o biogás"
      system "rake message:send_socket_message"
    end
  end

private
  def set_notification
    @notification = Notification.find(params[:id])
  end

end
