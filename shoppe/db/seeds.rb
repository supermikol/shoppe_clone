# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  Category.create(name: Faker::Commerce.department(1))
end

20.times do
  Animal.create(name: Faker::Commerce.product_name, species: Faker::Commerce.product_name, details: Faker::Hacker.say_something_smart, price: Faker::Commerce.price, img_url: Faker::Avatar.image(Faker::Name.first_name, "100x100"), quantity: rand(1..20))
end

30.times do
  animal = Animal.all.sample
  category = Category.all.sample.animals
  if category.include?(animal)
    next
  else
    category << animal
  end
end

User.create(email: "admin@admin.com", password: "password", admin: true)

Order.create(animal_id: 1, user_id: 1, item_quantity: 1, checked_out: false, address: "542 folsom")
Order.create(animal_id: 2, user_id: 1, item_quantity: 3, checked_out: false, address: "542 folsom")
Order.create(animal_id: 3, user_id: 1, item_quantity: 2, checked_out: false, address: "542 folsom")
