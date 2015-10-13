# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create([
  {title: 'admin'},
  {title: 'user'}
]) if Role.count == 0

products = Product.all
products.each do |p|
  p.destroy
end

categories = Category.all
categories.each do |c|
  c.destroy
end


categories = []
categories << Category.create(title: "Tea sort 1")
categories << Category.create(title: "Tea sort 2")
categories << Category.create(title: "Сoffee sort 1")
categories << Category.create(title: "Сoffee sort 2")
categories << Category.create(title: "Сoffee sort 3")

categories.each do |category|
  1.upto(40) do |n|
    Product.create(name: "#{category.title} #{n}",
                 description: "Best #{category.title} #{n}!!!",
                 category_id: category.id,
                 price: n * 120.35)
  end
end