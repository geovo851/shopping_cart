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

coffee_beans   = Category.create(title: "Coffee Beans")
instant_coffee = Category.create(title: "Instant Coffee")
green_tea      = Category.create(title: "Green Tea")
earl_grey_tea  = Category.create(title: "Earl Grey Tea")
instant_tea    = Category.create(title: "Instant Tea")


if Product.count == 0
    Product.create([
    {name: 'Clipper Green Tea With Lemon 26 Tea Bags 50G',
    description: 'Lemon Flavoured Green Tea. A light, crisp and highly refreshing green tea with a delicious lemony citrus zing.',
    category_id: green_tea.id,
    price: 1.29,
    photo: "1.jpg"},

    {name: 'Tetley Boost Green Tea Berry Burst 20S 40G',
    description: 'Flavoured Green Tea with added B Vitamins. Enjoy at least one mug a day as part of a varied and balanced diet and a healthy lifestyle.',
    category_id: green_tea.id,
    price: 1.59,
    photo: "2.jpg"},

    {name: 'Clipper Green With Mint 25 Teabags 50G',
    description: 'Peppermint Flavoured Green Tea. The perfect balancing act, this bright and breezy green tea has been infused with a cooling menthol peppermint flavour.',
    category_id: green_tea.id,
    price: 1.40,
    photo: "3.jpg"},

    {name: 'Twinings Earl Grey 50 Teabags 125G',
    description: 'Tea with the fragrant flavour of bergamot and lemon. ',
    category_id: earl_grey_tea.id,
    price: 2.79,
    photo: "4.jpg"},

    {name: 'Tick Tock Earl Grey Rooibos Tea 40\'S 100G',
    description: 'Rooibos Earl Grey Tea. A Great New British Tea Tradition. Naturally caffeine free Rooibos Earl Grey unites two great tea traditions in one deliciously satisfying cup.',
    category_id: earl_grey_tea.id,
    price: 1.99,
    photo: "5.jpg"},

    {name: 'Pg Tips 80 Cups Tea Granules 40G',
    description: 'Freeze dried instant tea. Made with 100% natural ingredients. Fully Rainforest Alliance Certified tea.',
    category_id: instant_tea.id,
    price: 2.69,
    photo: "6.jpg"},

    {name: 'Typhoo Q T Instant White Tea 150G',
    description: 'Instant black tea with whitener. Typhoo QT - Quick Tea gives you a quick and easy way to enjoy a tasty cuppa, with no mess or fuss.',
    category_id: instant_tea.id,
    price: 2.45,
    photo: "7.jpg"},

    {name: 'Nescafe Gold Blend Instant Coffee 200G',
    description: 'Freeze Dried Soluble Coffee. Nescafé Gold Blend instant coffee is a premium blend of 100% roasted coffee beans.',
    category_id: instant_coffee.id,
    price: 5.99,
    photo: "8.jpg"},

    {name: 'Carte Noire Decaffeinated Instant Coffee 100G',
    description: 'Decaffeinated soluble coffee. The sensual pleasure of Arabica-rich coffee. Rich and velvety in body, Carte Noire Décafféiné will seduce your palate.',
    category_id: instant_coffee.id,
    price: 3.90,
    photo: "9.jpg"},

    {name: 'Taylors Rich Italian Coffee Beans 227G',
    description: 'Coffee Beans. A rich, refined roast. Strength - 4. Arabica Coffee (100%).',
    category_id: coffee_beans.id,
    price: 3.49,
    photo: "10.jpg"},

    {name: 'Lavazza Caffe Espresso Coffee Beans 250G',
    description: 'Coffee beans. Lavazza Caffè Espresso is a intense and velvety blend, with a distinctive character, as found in the best traditions of Italian espresso.',
    category_id: coffee_beans.id,
    price: 3.90,
    photo: "11.jpg"
    }])
end