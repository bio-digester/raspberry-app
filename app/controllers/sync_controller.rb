class SyncController < ApplicationController
  def send_data
    system "rake sync:send_data"
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Dados enviados com sucesso.' }
    end
  end
end
