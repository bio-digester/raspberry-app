class SyncController < ApplicationController
  def send_data
    system "rake sync:send_data"
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Dados enviados com sucesso.' }
    end
  end

  def retrieve_data
    system "rake sync:retrieve_data"
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Dados recebidos com sucesso.' }
    end
  end

  def sincronize_data
    system "rake sync:sincronize_data"
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Dados sincronizados com sucesso.' }
    end
  end
end
