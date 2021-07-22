# frozen_string_literal: true

require 'socket'
require 'rack'
require 'rack/utils'

server = TCPServer.new('0.0.0.0', 3000)
def balance
  @start_balance = 100
  if @balance = File.exist?('./data/balance.txt')
    file = File.open('./data/balance.txt', 'r')
    @balance = File.read('./data/balance.txt').to_i
  else puts @balance == @start_balance
  end
end

def deposit_plus
 end

class App
  def call(env)
    req = Rack::Request.new(env)
    case req.path
    when '/'
            [200, { 'Content-Type' => 'text/html', 'encoding' => 'utf-8' }, ["Your start balance is #{balance}"]]
    when '/deposit'
            [200, { 'Content-Type' => 'text/html' }, ["What sum do you want to add to your balance?"]]
    when '/withdraw'
      [200, { 'Content-Type' => 'text/html' }, ['What sum do you want to withdraw from your balance?']]
    else
      [404, { 'Content-Type' => 'text/html' }, ['Not found']]
    end
  end
end

app = App.new

while connection = server.accept
  request = connection.gets
  method, full_path = request.split(' ')
  path = full_path.split('?')[0]

  status, headers, body = app.call({
                                     'REQUEST_METHOD' => method,
                                     'PATH_INFO' => path
                                   })

  connection.print("HTTP/1.1 #{status}\r\n")

  headers.each { |key, value| connection.print("#{key}: #{value}\r\n") }

  connection.print "\r\n"
  body.each { |part| connection.print(part) }
  connection.close
end
