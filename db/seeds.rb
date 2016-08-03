# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding the database..."

BOOKS       = 1000
GENRES      = 10
PUBLISHERS  = 20
AUTHORS     = 30

if Genre.count < GENRES
  n = GENRES - Genre.count
  puts "Creating #{n} genres..."
  n.times do
    Genre.create(name: Faker::Book.genre)
  end
end

if Publisher.count < PUBLISHERS
  n = PUBLISHERS - Publisher.count
  puts "Creating #{n} publishers..."
  n.times do
    Publisher.create(name: Faker::Book.publisher)
  end
end

if Author.count < AUTHORS
  n = AUTHORS - Author.count
  puts "Creating #{n} authors..."
  n.times do
    Author.create(name: Faker::Book.author)
  end
end

if Book.count < BOOKS
  n = BOOKS - Book.count
  puts "Creating #{n} books..."

  genres      = Genre.all
  publishers  = Publisher.all
  authors     = Author.all

  n.times do
    Book.create(
    title:      Faker::Book.title,
    excerpt:    Faker::Hipster.paragraph,
    author:     authors.sample,
    publisher:  publishers.sample,
    genre:      genres.sample
    )
  end
end
