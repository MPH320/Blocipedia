include Faker
require 'random_data'
require 'marky_markov'
markov = MarkyMarkov::TemporaryDictionary.new

markov.parse_file "zenfile.txt"

#Create Users

  5.times do
    user = User.create!(
    name:     Faker::Name.name,
    email:    RandomData.random_email,
    password: Faker::Internet.password
    )
  end
  users = User.all


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
 
 admin = User.create!(
  name:     'admin',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
  )

  #Create a standard member
  member = User.create!(
  name:     'member',
  email:    'member@example.com',
  password: 'helloworld'
  )
 
 puts "Seed finished"
 puts "#{User.count} users created."
 puts "#{Wiki.count} wikis created"
 

markov.clear! # Clear the temporary dictionary.