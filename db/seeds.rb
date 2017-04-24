# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

5.times do
  User.create!(
  username: RandomData.random_word,
  email: RandomData.random_email,
  password: 'helloworld'
  )
end

admin = User.create!(
  username: 'djl132',
  email: 'djl132@case.edu',
  password: 'helloworld'
)

5.times do
  group = Group.create!(
    name: RandomData.random_word,
    description: RandomData.random_sentence
  )
end

groups = Group.all

10.times do
  question = Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    group: groups.sample
  )
  question.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

questions = Question.all

20.times do
  answer = Answer.create!(
    body: RandomData.random_paragraph,
    question: questions.sample
  )
  answer.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

answers = Answer.all


10.times do
  comment = Comment.create!(
    body: RandomData.random_paragraph,
    answer: answers.sample
  )
  comment.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

puts "Finished seeding!"
