#spec/calculator_spec.rb
require './lib/calculator'
describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
  
    
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end
end

describe Calculator do
  describe "#multiply" do
    it "multiplies two numbers together" do
      calculator = Calculator.new
      expect(calculator.multiply(6, 5)).to eql(30)
    end
  end
end
