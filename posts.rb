# frozen_string_literal: true

module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each_with_index do |posts, i|
      puts "#{i} - #{posts}"
    end
  end

  def show
    print "Введите любой индекс сообщения (целое число от ноля и выше)\n"
    x = gets.chomp.to_i
    puts @posts[x]
  end

  def create
    puts 'Введите текст поста'
    @posts.push(gets.chomp.to_s)
    @posts.each_with_index do |posts, i|
      puts "#{i} - #{posts}"
    end
  end

  def update
    print "Введите любой индекс сообщения, которое вы хотите переписать (целое число от ноля и выше)\n"
    x = gets.chomp.to_i
    print "Введите новый текст сообщения\n"
    y = gets.chomp.to_s
    @posts.delete_at(x)
    @posts.insert(x, y)
  end

  def destroy
    print "Введите любой индекс сообщения, которое вы хотите удалить (целое число от ноля и выше)\n"
    x = gets.chomp.to_i
    @posts.delete_at(x)
    print "Сообщение удалено\n"
    end
  end

class CommentsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each_with_index do |posts, i|
      puts "#{i} - #{posts}"
    end
  end

  def show
    print "Введите любой индекс сообщения (целое число от ноля и выше)\n"
    x = gets.chomp.to_i
    puts @posts[x]
  end

  def create
    puts 'Введите текст поста'
    @posts.push(gets.chomp.to_s)
    @posts.each_with_index do |posts, i|
      puts "#{i} - #{posts}"
    end
  end

  def update
    print "Введите любой индекс сообщения, которое вы хотите переписать (целое число от ноля и выше)\n"
    x = gets.chomp.to_i
    print "Введите новый текст сообщения\n"
    y = gets.chomp.to_s
    @posts.delete_at(x)
    @posts.insert(x, y)
  end

  def destroy
    print "Введите любой индекс сообщения, которое вы хотите удалить (целое число от ноля и выше)\n"
    x = gets.chomp.to_i
    @posts.delete_at(x)
    print "Сообщение удалено\n"
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
#extend Resource позволяет нам использовать метод connection без создания инстанса. Плюс область видимости данного метода расширяется