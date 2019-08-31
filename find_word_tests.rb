require_relative '../find_words'


RSpec.describe FindWord do
  it 'convert 6686787825 phone to expected words' do
    expect(FindWord.find_combinations_of_number('6686787825')).to match_array( [["noun", "struck"], ["onto", "struck"],  ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"] )
  end

  it 'convert 2282668687 phone to expected words' do
    expect(FindWord.find_combinations_of_number('2282668687')).to match_array( [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], ["acta", "mounts"], "catamounts"] )
  end

  it 'raises error for invalid symbols (0) in the phone' do
    expect {FindWord.find_combinations_of_number('0')}.to raise_error(RuntimeError, "Invalid symbol '0' in the phone")
  end

  it 'raises error for invalid symbols (1) in the phone' do
    expect {FindWord.find_combinations_of_number('1')}.to raise_error(RuntimeError, "Invalid symbol '1' in the phone")
  end
end
