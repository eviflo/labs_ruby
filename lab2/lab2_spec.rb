# frozen_string_literal: true

require 'rspec'
require './lab2.rb'

RSpec.describe 'main_methods' do
  it 'x=20' do
    expect(foobar(20, 48)).to eq(y = 48)
  end
  it 'y=20' do
    expect(foobar(37, 20)).to eq(37)
  end
  it 'x!=20 y!=20' do
    expect(foobar(98, 75)).to eq(173)
  end
end
