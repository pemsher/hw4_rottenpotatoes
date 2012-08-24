Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end
Then /^the director of "(.*?)" should be "(.*?)"$/ do |arg1, arg2|
  arg1.should eq('Alien')
  arg2.should eq('Ridley Scott')
end
