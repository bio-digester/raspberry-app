require 'socket'        # Sockets are in standard library
namespace :message do
  desc "Send message to server"
  task :send_socket_message => :environment do
    puts "====================================================Send message===================================================="
    hostname = '127.0.0.1'
    port = 6500
    s = TCPSocket.open(hostname, port)
    s.send('O usuário irá remover o biogás da câmara de gás !',0)
    s.close
    end
end
