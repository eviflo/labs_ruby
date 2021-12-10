require 'rspec'
require './lab5.rb'

describe "stones_management" do
  it 'How to mock File.open for write with rspec 3.4' do
    @buffer = StringIO.new()
    @filename = "somefile.txt"
    @content = "the content fo the file"
    allow(File).to receive(:open).with(@filename,'w').and_yield( @buffer )

    # call the function that writes to the file
    File.open(@filename, 'w') {|f| f.write(@content)}

    # reading the buffer and checking its content.
    expect(@buffer.string).to eq(@content)
  end

end