FILE_ONE_NAME = ARGV[0]
FILE_TWO_NAME = ARGV[1]

def words_from_file(text_file)
  File.read(text_file).downcase.gsub(/[^a-z]/, " ").split
rescue
  puts "Give me #{text_file} and let's get the party started!"
  exit
end

file_one_words = words_from_file(FILE_ONE_NAME)
file_two_words = words_from_file(FILE_TWO_NAME).uniq

file_two_words.each do |word|
  file_one_words.delete word
end

file_one_word_count = {}

file_one_words.each do |word|
  file_one_word_count[word] = 0 unless file_one_word_count[word]
  file_one_word_count[word] += 1
end

file_one_word_count.sort_by { |word,count| count }
          .reverse[0...40]
          .each { |word, count| puts "#{word}: #{count}"}