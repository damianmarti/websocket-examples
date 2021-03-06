require 'rubygems'
require "bundler/setup"

require 'em-websocket'
require './config.rb'


class Channel
  
  def initialize
    @sockets = []
  end
  
  def subscribe(socket)
    @sockets << socket
  end
  
  def unsubscribe(socket)
    @sockets.delete socket
  end
  
  def send_message(msg)
    @sockets.each do |socket|
      socket.send msg
    end
  end
end

EventMachine.run {
  
  @channel = Channel.new

  EventMachine::WebSocket.start(:host => '127.0.0.1', :port => 8080, :debug => true) do |socket|
    socket.onopen {
      @channel.subscribe socket      
    }
    socket.onmessage { |msg|
      @channel.send_message msg
    }
    socket.onclose {
      @channel.unsubscribe socket
    }
  end
  
}
