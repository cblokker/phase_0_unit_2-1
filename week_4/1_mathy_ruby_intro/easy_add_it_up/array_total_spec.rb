require_relative "my_solution.rb"

describe 'total' do
  let(:array_1) { [1, 2, 3, 4, 5, 5, 7] }
  let(:array_2) { [4, 4, 5, 5, 6, 6, 6, 7] }
  let(:array_3) { [2, 4, 1, 7, "milk", 99] }
  let(:array_4) { [] }

  it "is defined as a method" do
    expect(defined? total).to eq 'method'
  end

  it "requires a single argument" do
    expect(method(:total).arity).to eq 1
  end

  it "returns the correct total of array 1" do
    expect(total(array_1)).to eq 27
  end

  it "returns the correct total of array 2" do
    expect(total(array_2)).to eq 43
  end

  it "return an error for array 3" do
    total(array_3).should eq "Error"
  end

  it "return an error for array 4" do
    total(array_3).should eq "Error"
  end
end

describe 'sentence_maker' do
  let(:first_sentence) {["all", "my", "socks", "are", "dirty"]}
  let(:second_sentence) {["alaska", "has", "over", 586, "thousand", "miles"]}
  let(:third_sentence) {["barstow", "is", "in", "the.", "middle", "of", "nowhere", "."]}
  let(:fourth_sentence) {[]}

  it "is defined as a method" do
    expect(defined? sentence_maker).to eq 'method'
  end

  it "requires a single argument" do
     expect(method(:total).arity).to eq 1
  end

  it "returns the grammatically correct sentence of the first sentence" do
    expect(sentence_maker(first_sentence)).to eq "All my socks are dirty."
  end

  it "returns the grammatically correct sentence of the second sentence" do
    expect(sentence_maker(second_sentence)).to eq "Alaska has over 586 thousand miles."
  end

  it "returns the grammatically correct sentence of the third sentence" do
    sentence_maker(third_sentence).should eq "Barstow is in the. middle of nowhere."
  end  

  it "returns \"null_array\" for the fourth sentence" do
    sentence_maker(fourth_sentence).should eq "null_array"
  end  
end
