require 'faker'

24.times do 
  t = Topic.create(title: Faker::Lorem.word)
  3.times do
    t.bookmarks.create(url: Faker::Internet.url)
  end
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
