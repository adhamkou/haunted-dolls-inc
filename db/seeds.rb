require "open-uri"

Booking.destroy_all
Doll.destroy_all
User.destroy_all

owner_one = User.create!(first_name: 'Ayat', last_name: 'Amin', email: 'a@a.a', password: '123456')
owner_two = User.create(first_name: 'Maggie', last_name: 'Hum', email: 'a@b.a', password: '1234567')
owner_three = User.create(first_name: 'You', last_name: 'Pan', email: 'a@c.a', password: '12345678')

p 'created three owners'

doll1 = Doll.new(name: 'Scary Marge',
                 description: 'Shes loves to scream in the middle of the night',
                 price: 19,
                 location: 'Toronto',
                 user: owner_three)
file = File.open("#{Rails.root}/app/assets/images/image1.png")
doll1.image.attach(io: file, filename: "nes.png", content_type: "image/png")
doll1.save!

doll2 = Doll.new(name: 'Creepy Pete',
             description: 'He tends to scratch walls all night long',
             price: 80,
             location: 'Montreal',
             user: owner_three)
file = File.open("#{Rails.root}/app/assets/images/image2.png")
doll2.image.attach(io: file, filename: "nes.png", content_type: "image/png")
doll2.save!

doll3 = Doll.new(name: 'Grumpy Gertrude',
             description: 'She stinks up the place all while lauighing',
             price: 70,
             location: 'Chicago',
             user: owner_three)
file = File.open("#{Rails.root}/app/assets/images/image3.png")
doll3.image.attach(io: file, filename: "nes.png", content_type: "image/png")
doll3.save!

attributes1 = [
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677615112/development/fk5bu0dcok9wv4quu6tufhw1m3ym.webp',
    address: 'New-York' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677617010/development/1qs3fpfro82ifg9dnbutdmqx4z7g.webp',
    address: 'Tokyo' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677706851/production/ec38kq2k77eo0h70jo16axthzmfo.jpg',
    address: 'Paris' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700618/photo-1533662958083-61eb6094138c_knbfle.jpg',
    address: 'Dubai' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700585/photo-1519892338195-90abfe1f6984_qnjumi.jpg',
    address: 'Barcelona' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700555/photo-1635364796711-7018d19e5e58_ynba0d.jpg',
    address: 'Rome' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700384/photo-1583656391619-488983c384e6_rpj8lr.jpg',
    address: 'Vancouver' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700302/photo-1512839112604-a05d02098d9e_ywb1xh.jpg',
    address: 'Los Angeles' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699653/photo-1467103789230-f91a5ff8048a_lvn86a.jpg',
    address: 'Istanbul' }
]

attributes2 = [
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699620/photo-1596215516573-fdeebc0b6070_e9syfa.jpg',
    address: 'Seoul' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699589/photo-1583334506779-8f63fae3d11d_x0phys.jpg',
    address: 'lisbon' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699562/photo-1551875671-d593541a4b84_psnu8a.jpg',
    address: 'Rio' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699516/photo-1613626253486-e2d1d9fd9bc9_yma2cs.jpg',
    address: 'Hong Kong' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699471/photo-1612506001235-f0d0892aa11b_k1coc3.jpg',
    address: 'Antigua' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677875690/photo-1602306081673-f26c56e0c0c8_z2tx2y.jpg',
    address: 'Helsinki' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677875860/photo-1567801527751-627d3e17ac1c_qyp0wd.jpg',
    address: 'Sydney' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677875883/photo-1654440243440-c63ee3cc6bb4_sbdyr3.jpg',
    address: 'Wisconsin' },
  { img: 'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677876076/photo-1532059196142-bd2a6bbbaa55_ahr6bs.jpg',
    address: 'Montpellier' }
]

attributes1.each do |attr|
  doll = Doll.new(
    name: Faker::Name.female_first_name,
    price: Faker::Commerce.price,
    description: Faker::Movies::Hobbit.quote,
    location: attr[:address],
    user: owner_one
  )
  file = URI.open(attr[:img])
  doll.image.attach(io: file, filename: "nes.png", content_type: "image/jpg")
  doll.save!
  p "Doll with id #{doll.id}"
end

attributes2.each do |attrr|
  doll = Doll.new(
    name: Faker::Name.female_first_name,
    price: Faker::Commerce.price,
    description: Faker::Movies::Hobbit.quote,
    location: attrr[:address],
    user: owner_two
  )
  file = URI.open(attrr[:img])
  doll.image.attach(io: file, filename: "nes.png", content_type: "image/png")
  doll.save!
end
