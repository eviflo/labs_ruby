# frozen_string_literal: true

require 'rspec'
require './lab5'

RSpec.describe StonesManagement do
  let (:stones) do
    stones= File.readlines("./data2/stones.txt").map(&:chomp)
  end

  #before { File.write(FILE_OPENED, string) }
  subject {StonesManagement}
  it 'self.index' do
    expect(StonesManagement.index).to eq(stones)
  end
  it 'self.find(id)' do
    id = 4
    expect(StonesManagement.find(4)).to eq("Afghanite\n")
  end
  it 'self.where(pattern)' do
    expect(StonesManagement.where("Afghanite\n")).to eq(4)
  end
  it 'self.update(id, text)' do
    id = 6
    text = "some_queer_stone"
    expect(StonesManagement.update(6, "some_queer_stone")).to eq("Файл обновлен, название нового камня под номером 6 теперь some_queer_stone\n")
  end
  it 'self.delete(id)' do
    id = 8
    expect(StonesManagement.delete(8)).to eq("\n")
  end
end

