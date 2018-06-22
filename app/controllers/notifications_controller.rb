class NotificationsController < ApplicationController
  def get_last_notification
    @notifications = Notification.where(visualized: false).uniq
    render json: @notifications
  end

  def read_notification
    notificacao = Notification.find(params[:id])
    notificacao.visualized = true
    if notificacao.message == "[WARNING] O nível de alimentação está no limite, retire o biofertilizante" || notificacao.message == "[WARNING] Retire o Biogás"
      system "rake message:send_socket_message"
    end
    notificacao.save()
  end

  def send_first_socket_message
    system "rake message:send_first_socket_message"
  end

end
