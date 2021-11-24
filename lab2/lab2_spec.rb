# frozen_string_literal: true

require 'rspec'
require './lab2.rb'

RSpec.describe 'main_methods' do
  it 'x=20' do
    x = 20
    allow_any_instance_of(Kernel).to receive(:gets).and_return('20', '45')
        expect(foobar).to eq('x=20')
  end
  it 'y=20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('45', '20')
    expect(foobar).to eq('y=20')
  end
  it 'x!=20 y!=20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('37', '12')
    expect(foobar).to eq('Neither of them is 20, the sum of the numbers is 37+12=49')
  end
end
