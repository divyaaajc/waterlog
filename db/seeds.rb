# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating users..."
  benjamin = User.create(email: "benj@test.com", password: "123456", first_name: "Benjamin", last_name: "Kennedy")
  lisa = User.create(email: "lisa@test.com", password: "123456", first_name: "Lisa", last_name: "Simpson")
  jimmy = User.create(email: "jimmy@test.com", password: "123456", first_name: "Jimmy", last_name: "Cat")

puts "Creating waters..."
file = URI.open('https://ecom-su-static-prod.wtrecom.com/images/products/11/LN_437956_BP_11.jpg')
acquapanna = Water.create(name: "Acquapanna", brand: "Acquapanna", description: "Acqua Panna, the Italian natural spring water, comes from the Tuscany's hills. With its smooth taste, it's the right partner of all your life experiences.", ph: "8", source: "Tuscany", country: "Italy")
acquapanna.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://produits.bienmanger.com/40000-0w600h600_Orezza_Sparkling_Mineral_Water_From_Corsica.jpg')
orezza = Water.create(name: "Orezza", brand: "Orezza", description: "Orezza water, is a natural mineral water, which has had the natural carbon dioxide from the spring re-added. It is acknowledged as one of the mineral waters with the highest iron levels in the world.", ph: "5.5", source: "Corsica", country: "France")
orezza.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('http://cdn.shopify.com/s/files/1/0078/7038/2195/products/EvianNaturalSpringWaterPlasticBottleMultipack_8x1.5L_1024x1024.png?v=1606545455')
evian = Water.create(name: "Evian", brand: "Evian", description: "evian still natural mineral water. From the pristine Alps. ... From our pristine mountain Alpine source to you, evian natural mineral water is delicately crafted by nature through its 15 year journey, arriving at its protected source with a unique balance of minerals.", ph: "7.5", source: "Évian-les-Bains", country: "France")
evian.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('http://cdn.shopify.com/s/files/1/0078/7038/2195/products/evian_virgil_bold_blue_500ml_1024x1024.png?v=1606545265
')
evian_virgil_abloh = Water.create(name: "Evian x Virgil Abloh", brand: "", description: "", ph: "", source: "", country: "")
evian_virgil_abloh.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://packagingeurope.com/downloads/4620/download/JUST2_210818.jpg?cb=24a40a636d11b24d02d9a96946f73cca&w=1200')
just_water = Water.create(name: "Just Water", brand: "", description: "", ph: "", source: "", country: "")
just_water.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://uploads.ifdesign.de/award_img_300/oex_large/146606_02_1800x1800-01.jpg')
krystal = Water.create(name: "Krystal", brand: "", description: "", ph: "", source: "", country: "")
krystal.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://lh3.googleusercontent.com/proxy/yZ0NzANiZ4t0BGhQd5CBemEPaHu1oa2nyZMgaWRAWWVA1u6KlKBC4ObN7TaNqXLJ7VexakdJsCxDfBDH6Up0C4RGsTer7eFhyiw_GdhGZrA')
finé = Water.create(name: "Finé", brand: "", description: "", ph: "", source: "", country: "")
finé.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://produits.bienmanger.com/37010-0w470h470_Veen_Velvet_Still_Water_From_Finland.jpg')
veen = Water.create(name: "Veen", brand: "", description: "", ph: "", source: "", country: "")
veen.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://lh3.googleusercontent.com/proxy/V0u5IcLlz1t2Gd6K9wVvjzJQ9uzrJaaZuBbbfLo9awzzWCmU4[…]PmZPJhlynK5IKhtSWQ6Z4j7A_RIOL5pGzNd2gT-HuJZWOcKBItlr6MWq')
castello = Water.create(name: "Castello", brand: "", description: "", ph: "", source: "", country: "")
castello.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://www.drinksupermarket.com/media/catalog/product/cache/0288c1cb4e2e8b328879830e17ef5901/b/e/belu-still-water-12x-75cl-glass-bottle_temp.jpg')
belu = Water.create(name: "Belu", brand: "", description: "", ph: "", source: "", country: "")
belu.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')