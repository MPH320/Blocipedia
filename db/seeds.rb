require 'random_data'
require 'marky_markov'
markov = MarkyMarkov::TemporaryDictionary.new

markov.parse_file "zenfile.txt"


 # Create Wikis
 50.times do
 # #1
   Wiki.create!(
 # #2
     title:  markov.generate_1_sentences,
     body:   markov.generate_5_sentences,
     private: false
   )
 end
 wikis = Wiki.all
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 

markov.clear! # Clear the temporary dictionary.