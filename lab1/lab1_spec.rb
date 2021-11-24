require 'rspec'
require './lab1.rb'

RSpec.describe 'main_methods' do
  it 'less than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Lilu', 'Nemenko', '17')
    expect(greeting).to eq("Hello, Lilu Nemenko!!! You are less than 18 years old, but it's never late to start with programming.")
  end
  it 'more than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Lilu','Nemenko', '25')
    expect(greeting).to eq("Hello, Lilu Nemenko!!! It's time to start with programming!")
  end

end