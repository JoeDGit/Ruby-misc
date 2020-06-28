#spec/cc_test.rb
require 'rspec'
require './lib/cc.rb'
describe Cc do
  describe '#caesar_cipher' do
    it "Accepts two parameters, string and number, the method shifts the letters of the string along the alphabet by 'number' places" do
    cc = Cc.new
    expect(cc.caesar_cipher('dog', 3)).to eql('grj')
    expect(cc.caesar_cipher('amazon', 7)).to eql('hthgvu')
    expect(cc.caesar_cipher('wizard', 10)).to eql('gsjkbn')
    expect(cc.caesar_cipher('research', 6)).to eql('xkykgxin')
    expect(cc.caesar_cipher('tomato', 12)).to eql('faymfa')
    expect(cc.caesar_cipher('dashboard', 20)).to eql('xumbviulx')
  end
  end
end