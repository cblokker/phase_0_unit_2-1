require_relative 'my_solution'

describe 'get_grade' do
  let(:arrayA) { [100,90,100,99,99]}
  let(:arrayB) { [80,90,80,89,98]}
  let(:arrayC) { [70,80,70,79]}
  let(:arrayD) { [60,67,70,63]}
  let(:arrayF) { [50.2,40,0,99,9]}
  let(:arrayG) {[52,21.5,95,97,98,true,"bicycle"]}
  let(:arrayH) {[]}
  
  it 'is defined as a method' do
    expect(defined? get_grade).to eq 'method'
  end
  it 'returns "A" when the average is >= 90' do
    expect(get_grade(arrayA)).to eq "A"
  end
  it 'returns "B" when the average is >= 80' do 
    expect(get_grade(arrayB)).to eq "B"
  end
  it 'returns "C" when the average is >= 70' do
    expect(get_grade(arrayC)).to eq "C"
  end
  it 'returns "D" when the average is >= 60' do
    expect(get_grade(arrayD)).to eq "D"
  end
  it 'returns "F" when the average is < 60' do
    expect(get_grade(arrayF)).to eq "F"
  end
  it 'returns "Error" when the array contains non-numbers' do
    get_grade(arrayG).should eq "Error"
  end
  it 'returns "Error" when the array is empty' do
    get_grade(arrayH).should eq "Error"
  end
end