class NotificationsController < ApplicationController
  def get_last_notification
    @notifications = Notification.where(visualized: false).uniq
    render json: @notifications
  end

  def read_notification
    notificacao = Notification.find(params[:id])
    notificacao.visualized = true
    if notificacao.message == "[ALERT] O biogás está pronto para ser retirado" || notificacao.message == "[DANGER] Retire urgentemente o biogás"
      system "rake message:send_socket_message"
    end
    notificacao.save()
  end

end
