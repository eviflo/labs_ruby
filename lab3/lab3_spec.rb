# frozen_string_literal: true

require 'rspec'
require './lab3'

RSpec.describe 'main_methods' do
  it 'cs ending' do
    expect(num_word('comics')).to eq(64)
  end
  it 'not cs' do
    expect(num_word('comic')).to eq('cimoc')
  end
end
