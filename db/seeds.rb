require 'open-uri'
require 'nokogiri'

Water.destroy_all
User.destroy_all

puts "Creating users..."

benjamin = User.create(email: "benj@test.com", password: "123456", username: "benkennedy")
lisa = User.create(email: "lisa@test.com", password: "123456", username: "lisasimpson")
jimmy = User.create(email: "jimmy@test.com", password: "123456", username: "jimmycat")

url = "http://www.finewaters.com/bottled-waters-of-the-world/"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

countries = []
urls = []

html_doc.search('.parent a').each do |element|
  countries.push(element.text.strip)
end

countries.each do |country|
  country.gsub!(" ", "-")
  url = "http://www.finewaters.com/bottled-waters-of-the-world/#{country.downcase}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.list-title a').each do |element|
    urls.push(element.attribute('href').value)
  end
end

puts "Creating waters..."
urls.each do |url|
  fine_waters = "http://www.finewaters.com/#{url}"
  html_file = URI.open(fine_waters).read
  html_doc = Nokogiri::HTML(html_file)
  new_water = Water.new

  html_doc.search('.page-header h2').each do |element|
    new_water.name = element.text.strip
  end

  html_doc.search('.tbl-sec-src').each do |element|
    new_water.country = element.search("td:contains('Country') + td").text.strip
    new_water.country = "Colombia" if new_water.country == "Colomcia"
    new_water.source =  element.search("td:contains('Place') + td").text.strip
    new_water.brand = element.search("td:contains('Company') + td").text.strip
  end
  
  text = html_doc.search('.located-beneath').map do |element|
    element.text.strip.length < 5 ? nil : element.text.strip
  end
  new_water.description = text.compact.uniq.join

  new_water.photo = "http://www.finewaters.com#{html_doc.search('.lft-part').first.search('img').attribute('src').value}"
  
  html_doc.search('.wt-anlss').each do |element|
    new_water.ph = element.search("td:contains('ph') + td").text.strip
    # p element.search("td:contains('Hardness') + td").first.text.strip
    # p element.search("td:contains('Minerality') + td").text.strip
    # p element.search("td:contains('Balance') + td").text.strip
  end
  # p new_water.name
  # p new_water.description
  new_water.save
end
 
# get all waters where lon/lat was not set by "source" and set by "country"
Water.where(longitude: [nil, ""]).each do |water|
  latitude = Geocoder.search(water.country).first.coordinates.first
  longitude = Geocoder.search(water.country).first.coordinates.last
  water.update(latitude: latitude, longitude: longitude)
end

puts "#{Water.count} waters saved!!!"

# puts "Creating waters..."
# acquapanna = Water.create(photo: 'https://ecom-su-static-prod.wtrecom.com/images/products/11/LN_437956_BP_11.jpg', name: "Acquapanna", brand: "Acquapanna", description: "Acqua Panna, the Italian natural spring water, comes from the Tuscany's hills. With its smooth taste, it's the right partner of all your life experiences.", ph: "8", source: "Tuscany", country: "Italy")

# orezza = Water.create(photo: 'https://produits.bienmanger.com/40000-0w600h600_Orezza_Sparkling_Mineral_Water_From_Corsica.jpg', name: "Orezza", brand: "Orezza", description: "Orezza water, is a natural mineral water, which has had the natural carbon dioxide from the spring re-added. It is acknowledged as one of the mineral waters with the highest iron levels in the world.", ph: "5.5", source: "Corsica", country: "France")

# evian = Water.create(photo: 'http://cdn.shopify.com/s/files/1/0078/7038/2195/products/EvianNaturalSpringWaterPlasticBottleMultipack_8x1.5L_1024x1024.png?v=1606545455', name: "Evian", brand: "Evian", description: "evian still natural mineral water. From the pristine Alps. ... From our pristine mountain Alpine source to you, evian natural mineral water is delicately crafted by nature through its 15 year journey, arriving at its protected source with a unique balance of minerals.", ph: "7.5", source: "Évian-les-Bains", country: "France")

# evian_virgil_abloh = Water.create(photo: 'http://cdn.shopify.com/s/files/1/0078/7038/2195/products/evian_virgil_bold_blue_500ml_1024x1024.png?v=1606545265', name: "Evian x Virgil Abloh", brand: "Evian", description: "The evian x Virgil Abloh Soma Collection features two highly-desirable, refillable 75cL evian glass bottles, designed as a hydration accessory for trendy and conscious consumers.", ph: "7.2", source: "Évian-les-Bains", country: "France")

# just_water = Water.create(photo: 'https://packagingeurope.com/downloads/4620/download/JUST2_210818.jpg?cb=24a40a636d11b24d02d9a96946f73cca&w=1200', name: "Just Water", brand: "Just Water", description: "JUST® delivers everyday products that are responsibly sourced and packaged for improved environmental and social impact. The JUST water bottle is not just a paper bottle, it's made up of 82% renewable resources while reducing CO2 emissions up to 74% compared to traditional plastic bottles", ph: "8", source: "Glens Falls", country: "USA")

# krystal = Water.create(photo: 'https://uploads.ifdesign.de/award_img_300/oex_large/146606_02_1800x1800-01.jpg', name: "Krystal", brand: "Krystal", description: "KRYSTAL flows from the pristine Lesser Khingan Mountains on the Chinese-Siberian frontier into the untouched underground Beian aquifer, where it is bottled at source. It is abundant in minerals and trace elements including sodium bicarbonate, metasilicic acid, calcium and silica.", ph: "8.4", source: "Heilongjiang", country: "China")

# finé = Water.create(photo: 'https://lh3.googleusercontent.com/proxy/yZ0NzANiZ4t0BGhQd5CBemEPaHu1oa2nyZMgaWRAWWVA1u6KlKBC4ObN7TaNqXLJ7VexakdJsCxDfBDH6Up0C4RGsTer7eFhyiw_GdhGZrA', name: "Finé", brand: "Finé", description: "Only after tens of thousands of years filtering naturally through 600 meters of ancient volcanic rock does water attain the mineral-rich, pollutant-free purity it needs to be deemed Eau Finé.", ph: "7.8", source: "Shuzenji", country: "Japan")

# veen = Water.create(photo: 'https://produits.bienmanger.com/37010-0w470h470_Veen_Velvet_Still_Water_From_Finland.jpg', name: "Veen", brand: "Veen", description: "VEEN’s natural mineral waters originate in the Eastern Himalayas in what is known as the “Last Shangri-La”, the Kingdom of Bhutan. The Bhutanese have treasured their natural environment, as it is seen as a source of all life and the abode of the gods and spirits.", ph: "7.2", source: "Samtse", country: "Bhutan")

# castello = Water.create(photo: 'https://lh3.googleusercontent.com/proxy/fm22htZx0eMkSQVYgtAohL1tSNnz3h_MUiIeebmv701N_HBy3MlxtzbmtSuYO4IiBBi5HXaJSVY4gos91In7bCUUmguAVLUuMeqVlWpxu-M930ExL8OL_awmWyF77fqs', name: "Castello", brand: "Castello", description: "CASTELLO is centenary water with springs in Pisões-Moura. It was launched in 1899 by the company Águas de Moura and remains a benchmark in the market sector of sparkling waters. ... Today, ÁGUA CASTELLO remains as fresh as the day the first drops were extracted from its spring.", ph: "5.35", source: "Baixo-Alentejo", country: "Portugal")

# belu = Water.create(photo: 'https://www.drinksupermarket.com/media/catalog/product/cache/0288c1cb4e2e8b328879830e17ef5901/b/e/belu-still-water-12x-75cl-glass-bottle_temp.jpg', name: "Belu", brand: "Belu", description: "Belu is a UK based drinks company. The company claims to produce carbon-neutral and ethically-sourced bottled waters and filtration systems, and to donate 100% of its profits to WaterAid.", ph: "7.5", source: "Shropshire", country: "United Kingdom")