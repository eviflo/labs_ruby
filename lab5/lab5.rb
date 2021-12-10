# frozen_string_literal: true

FILE_OPENED = './data2/stones.txt'
TEMP_FILE = './data2/tmp_file.txt'
def index
  stones = []
  File.foreach(FILE_OPENED).with_index do |stone, id|
    stones.push(stone, id)
    end
  puts stones
  stones.inspect
  end

#variant 2
# def index
#   @stones = File.foreach(FILE_OPENED).with_index do |stone, id|
#     puts "#{id} : #{stone}"
#   end
# end

def find(index)
  File.foreach(FILE_OPENED).with_index do |stone, id|
    @stone = stone if id == index
  end
  puts @stone
end

def where(pattern)
  File.foreach(FILE_OPENED).with_index do |stone, id|
    @stone_id = id if stone.include?(pattern)
  end
  @stone_id
end

def update(id, text)
  file = File.open(TEMP_FILE, 'w')
  File.foreach(FILE_OPENED).with_index do |stone, index|
    file.puts(id == index ? text : stone)
  end
  file.close
  File.write(FILE_OPENED, File.read(TEMP_FILE))
  File.delete(TEMP_FILE) if File.exist?(TEMP_FILE)
end

def delete(id)
  file = File.open(TEMP_FILE, 'w')
  File.foreach(FILE_OPENED).with_index do |stone, index|
    file.puts(id == index ? nil : stone)
  end
  file.close
  File.write(FILE_OPENED, File.read(TEMP_FILE))
  File.delete(TEMP_FILE) if File.exist?(TEMP_FILE)
end

