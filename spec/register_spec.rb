require "cart"
require "product"
require "receipt"
require "register"
require 'tempfile'

describe "register" do
  it "init should throw argument error if non standard input" do
    temp_file = Tempfile.new("test")
    temp_file.write("2 chocolates 4.99")
    temp_file.close
    expect{ Register.new(temp_file) }.to raise_error(ArgumentError)
  end
end