# frozen_string_literal: true

class StonesManagement
  attr_accessor :index, :stone, :stones

  FILE_OPENED = './data2/stones.txt'
  TEMP_FILE = './data2/tmp_file.txt'

  def self.index
    stones = []
    File.foreach(FILE_OPENED) do |stone|
      stones.push(stone)
    end
    stones.map(&:chomp)
  end

  def self.find(index)
    stones = []
    File.foreach(FILE_OPENED) do |stone|
      stones.push(stone)
    end
    @stone = stones[index]
  end

  def self.where(pattern)
    File.foreach(FILE_OPENED).with_index do |stone, id|
      @stone_id = id if stone.include?(pattern)
    end
    @stone_id
  end

  def self.update(id, text)
    file = File.open(TEMP_FILE, 'w')
    File.foreach(FILE_OPENED).with_index do |stone, index|
      file.puts(id == index ? text : stone)
    end
    file.close
    File.write(FILE_OPENED, File.read(TEMP_FILE))
    File.delete(TEMP_FILE) if File.exist?(TEMP_FILE)
    stones = []
    File.foreach(FILE_OPENED) do |stone|
      stones.push(stone)
    end
    "Файл обновлен, название нового камня под номером #{id} теперь #{stone = stones[id]}"
  end

  def self.delete(id)
    file = File.open(TEMP_FILE, 'w')
    File.foreach(FILE_OPENED).with_index do |stone, index|
      file.puts(id == index ? nil : stone)
    end
    file.close
    File.write(FILE_OPENED, File.read(TEMP_FILE))
    File.delete(TEMP_FILE) if File.exist?(TEMP_FILE)
    stones = []
    File.foreach(FILE_OPENED) do |stone|
      stones.push(stone).map(&:chomp)
    end
    stones[id]
  end
  # puts StonesManagement.where('diamond')
   puts StonesManagement.delete(20)
end
