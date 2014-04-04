require 'faker'

24.times do 
  Bookmark.create(title: Faker::Lorem.word, url: Faker::Internet.url)
end

puts "Seed finished"
puts "#{Bookmark.count} bookmarks created"

