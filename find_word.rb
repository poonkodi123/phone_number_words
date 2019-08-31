class FindWord
  require 'benchmark'
  def self.find_combinations_of_number(numbers)
   #checked here length is equal to 10 and number not containing 0 and 1
    return [] if numbers.nil? || numbers.length != 10 || (numbers.include?("0") || numbers.include?("1"))
     @letters_value =   {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}   
    #get value based on given numbers
    keys = numbers.chars.collect{|n| @letters_value[n]}
    all_letters ||= []
    #get all words form dictionary
    File.readlines('dictionary.txt').map{|w| all_letters << w.strip.downcase}
    total_keys = keys.length - 1
    results = []
    for i in (1..total_keys)
      first_array = keys[0..i]
      second_array = keys[i + 1..total_keys]
     # length is more then 3 
      next if first_array.length < 3 || second_array.length <3
      #prepare combination of all string
      first_combination = first_array.shift.product(*first_array).map(&:join)
      next if first_combination.nil?
      #array of all combinations of elements from all arrays.
      second_combination = second_array.shift.product(*second_array).map(&:join)
      next if second_combination.nil?
      #get words includes in all words
      results <<  [(first_combination & all_letters), (second_combination & all_letters)] 
    end 
    #check onces all combination words, join into results array
    results <<(keys.shift.product(*keys).map(&:join) & all_letters).join(',')
    return  results
   end
end



final_words = FindWord
puts "Please Phone number excluding 0 and 1"
input = gets.chomp
 #sample input 6686787825,2282668687
time = Benchmark.measure {
   data = final_words.find_combinations_of_number(input)
   puts "Output is"
   print data
 }
puts "\n"
puts "Total Execution Time"
puts time.real
