# frozen_string_literal: true

require 'rspec'
require './lab4'

RSpec.describe 'main_methods' do
  it 'array' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1', 'lala', 'red')
    expect(pokemon_create).to eq([{ name: 'lala', color: 'red' }])
  end
  it 'count' do
    pokemon_num = 1
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1', 'lala', 'red')
    expect(pokemon_create.count).to eq(pokemon_num)
  end
end
