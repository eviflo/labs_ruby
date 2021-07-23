# frozen_string_literal: true

require 'socket'
require 'rack'
require 'rack/utils'

server = TCPServer.new('0.0.0.0', 3000)
def balance
  balance = 100
  if File.exist?('./data/balance.txt')
    file = File.open('./data/balance.txt', 'r')
    balance = File.read('./data/balance.txt').to_i
  end
  balance
end

def load_balance
  balance = 100
  if File.exist?('./data/balance.txt')
    file = File.open('./data/balance.txt', 'r')
    balance = File.read('./data/balance.txt').to_i
  end
  balance
end

class App
  def call(env)
    req = Rack::Request.new(env)
    req.params['value']
        case req.path
    when '/'
            [200, { 'Content-Type' => 'text/html', 'encoding' => 'utf-8' }, ["Your start balance is #{balance}"]]
    when '/deposit'
            [200, { 'Content-Type' => 'text/html' }, ["What sum do you want to add to your balance? #{deposit_plus(req.params['value'].to_f)}"]]
    when '/withdraw'
      [200, { 'Content-Type' => 'text/html' }, ["What sum do you want to withdraw from your balance? #{deposit_withdraw(req.params['value'].to_f)}"]]
    else
      [404, { 'Content-Type' => 'text/html' }, ["Not found"]]
    end
  end
end

def deposit_plus(deposit_sum)
  balance = load_balance
  if deposit_sum >= 0
    puts balance + deposit_sum
    print "Сумма текущего баланса #{balance} + #{deposit_sum} =#{balance + deposit_sum} \n"
    File.open('./data/balance.txt', 'w+') do |file|
      file.write((balance + deposit_sum).to_s)
      print "Данные записаны\n"
      file.close
    end
  end
end

def deposit_withdraw(withdraw_sum)
  balance = load_balance
    if withdraw_sum <= balance
    balance - withdraw_sum
    print "Сумма текущего баланса #{balance} - #{withdraw_sum} =#{balance - withdraw_sum}\n"
    File.open('./data/balance.txt', 'w+') do |file|
      file.write((balance -withdraw_sum).to_s)
      print "Данные записаны \n"
      file.close
    end
  else print 'Вы ввели некорректное значение, перезапустите программу'
  end
end

app = App.new
while connection = server.accept
  request = connection.gets
  method, full_path = request.split(' ')
  parts = full_path.split('?')
  status, headers, body = app.call({
'REQUEST_METHOD' => method,
'rack.input' => '',
'PATH_INFO' => parts.first,
'QUERY_STRING' => parts.last
})
    connection.print("HTTP/1.1 #{status}\r\n")

  headers.each { |key, value| connection.print("#{key}: #{value}\r\n") }

  connection.print "\r\n"
  body.each { |part| connection.print(part) }
  connection.close
end
