# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Seeding database..."

# Create admin user
admin = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.username = "admin"
  user.password = "password"
  user.password_confirmation = "password"
  user.admin = true
  user.bio = "Platform Administrator"
  user.company = "Layer Zero"
  user.position = "Admin"
end
puts "Created admin user: #{admin.email}"

# Create regular users
user1 = User.find_or_create_by!(email: "john@example.com") do |user|
  user.username = "john_doe"
  user.password = "password"
  user.password_confirmation = "password"
  user.bio = "Designer and creative technologist"
  user.company = "Design Studio"
  user.position = "Creative Director"
  user.website = "https://johndoe.com"
  user.twitter = "johndoe"
end
puts "Created user: #{user1.email}"

user2 = User.find_or_create_by!(email: "jane@example.com") do |user|
  user.username = "jane_smith"
  user.password = "password"
  user.password_confirmation = "password"
  user.bio = "Writer and researcher"
  user.company = "Research Lab"
  user.position = "Senior Researcher"
  user.linkedin = "janesmith"
end
puts "Created user: #{user2.email}"

# Create some tags
tags = ["design", "technology", "art", "research", "tutorial"]

# Create articles
article1 = user1.articles.find_or_create_by!(title: "Introduction to Modern Design") do |article|
  article.body = "<p>This is a comprehensive guide to modern design principles and practices.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>"
  article.status = :published
  article.published_at = 2.days.ago
  article.approved_by = admin
end
article1.tag_names = ["design", "tutorial"]
article1.save
puts "Created article: #{article1.title}"

article2 = user2.articles.find_or_create_by!(title: "The Future of Technology") do |article|
  article.body = "<p>Exploring emerging technologies and their impact on society.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>"
  article.status = :published
  article.published_at = 1.day.ago
  article.approved_by = admin
end
article2.tag_names = ["technology", "research"]
article2.save
puts "Created article: #{article2.title}"

article3 = user1.articles.find_or_create_by!(title: "Draft Article") do |article|
  article.body = "<p>This is a draft article that hasn't been published yet.</p>"
  article.status = :draft
end
article3.tag_names = ["design"]
article3.save
puts "Created draft article: #{article3.title}"

# Create collections
collection1 = user1.collections.find_or_create_by!(title: "Design Inspiration") do |collection|
  collection.description = "A curated collection of inspiring designs and resources."
end
collection1.tag_names = ["design", "art"]
collection1.save
puts "Created collection: #{collection1.title}"

# Add items to collection
collection1.collection_items.find_or_create_by!(title: "Interesting Link") do |item|
  item.item_type = "link"
  item.url = "https://example.com/design-article"
  item.position = 1
end

collection1.collection_items.find_or_create_by!(title: "Design Notes") do |item|
  item.item_type = "text"
  item.content = "These are some notes about design principles I've been thinking about..."
  item.position = 2
end

# Create follows
user1.follow(user2)
user2.follow(user1)
puts "Created follow relationships"

puts "Seeding completed!"
puts "\nTest Accounts:"
puts "  Admin: admin@example.com / password"
puts "  User 1: john@example.com / password"
puts "  User 2: jane@example.com / password"
