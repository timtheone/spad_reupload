# T# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding database"

company_seed = [
  {
  name: "SPAD",
  },

  {
  name: "Anatole",
  },
  {
  name: "Apple",
  }
]
Company.create!(company_seed)

user_url1 = "http://res.cloudinary.com/timtheone/image/upload/v1497511150/fimtsifnodo12qsoxfx3.jpg"
user1 = User.new(first_name: "Tim",
                 last_name: "Almamedov",
                 email: "tim.almamedov@spad.rocks",
                 company_id: 1,
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
user1.remote_portrait_url = user_url1
user1.save!

user_url3 = "http://res.cloudinary.com/timtheone/image/upload/v1497511413/dxdnqsaobu8eiju5zczy.jpg"
user3 = User.new(first_name: "Nicolas",
                 last_name: "Peltier",
                 company_id: 1,
                 email: "nicolas.peltier@spad.rocks",
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
user3.remote_portrait_url = user_url3
user3.save!



user_seed = [
  # {
  # first_name: "Tim",
  # last_name: "Almamedov",
  # email: "tim.almamedov@spad.rocks",
  # company_id: 1,
  # password: "password",
  # password_confirmation: "password",
  # admin: true
  # },

  {
  first_name: "John",
  last_name: "Dawson",
  company_id: 1,
  email: "john.dawson@spad.rocks",
  password: "password",
  password_confirmation: "password",
  admin: false
  },

  # {
  # first_name: "Nicolas",
  # last_name: "Peltier",
  # company_id: 1,
  # email: "nicolas.peltier@spad.rocks",
  # password: "password",
  # password_confirmation: "password",
  # admin: true
  # },

  {
  first_name: "Peter",
  last_name: "Drucker",
  company_id: 1,
  email: "peter.drucker@spad.rocks",
  password: "password",
  password_confirmation: "password",
  admin: false
  },
  {
  first_name: "Peter",
  last_name: "Thiele",
  company_id: 1,
  email: "peter.thiele@spad.rocks",
  password: "password",
  password_confirmation: "password",
  admin: false
  },
  {
  first_name: "David",
  last_name: "Allen",
  company_id: 1,
  email: "david.allen@spad.rocks",
  password: "password",
  password_confirmation: "password",
  admin: false
  }
]

credit_card_seed = [
  {
  number: "1111 2222 3333 3459",
  credit_card_type: "Visa",
  status: "Active",
  company_id: 1,
  billing_day: 20,
  exp_date: '08/19'
  },
    {
  number: "4444 2121 3333 3465",
  credit_card_type: "Visa",
  status: "Not active",
  company_id: 1,
  billing_day: 20,
  exp_date: '12/20'
  },
  {
  number: "4444 2121 3333 3447",
  credit_card_type: "Visa",
  status: "Not active",
  company_id: 1,
  billing_day: 20,
  exp_date: '01/20'
  }
]

category_seed = [
  {
  name: "Restaurant",
  company_id: 1,
  status: "Active"
  },
  {
  name: "Software",
  company_id: 1,
  status: "Active"
  },
  {
  name: "Travels",
  company_id: 1,
  status: "Active"
  },
  {
  name: "Fuel",
  company_id: 1,
  status: "Active"
  },
  {
  name: "Hotel",
  company_id: 1,
  status: "Active"
  }
]


# Company.create!(company_seed)
User.create!(user_seed)
CreditCard.create(credit_card_seed)
Category.create!(category_seed)

# user_url3 = "http://res.cloudinary.com/timtheone/image/upload/v1497511413/dxdnqsaobu8eiju5zczy.jpg"
# user3 = User.new(first_name: "Nicolas",
#                  last_name: "Peltier",
#                  company_id: 1,
#                  email: "nicolas.peltier@spad.rocks",
#                  password: "password",
#                  password_confirmation: "password",
#                  admin: true)
# user3.remote_portrait_url = user_url3
# user3.save!

# user_url1 = "http://res.cloudinary.com/timtheone/image/upload/v1497511150/fimtsifnodo12qsoxfx3.jpg"
# user1 = User.new(first_name: "Tim",
#                  last_name: "Almamedov",
#                  email: "tim.almamedov@spad.rocks",
#                  company_id: 1,
#                  password: "password",
#                  password_confirmation: "password",
#                  admin: true)
# user1.remote_portrait_url = user_url1
# user1.save!


url1 = "http://res.cloudinary.com/timtheone/image/upload/v1497537935/IMG_7399_l7kb2o.jpg"
expense1 = Expense.new(user_id: 1, date: Date.new(2017,6,14), amount: 154,
                      company_id: 1,
                      category_id: 1,
                      credit_card_id: 1)
expense1.remote_receipt_url = url1
expense1.save!

url2 = "http://res.cloudinary.com/timtheone/image/upload/v1497514403/xhmp4ztsdq2lxebrjxx9.pdf"
expense2 = Expense.new(user_id: 1, date: Date.new(2017,6,11), amount: 243.46,
                      company_id: 1,
                      category_id: 3,
                      credit_card_id: 1)
expense2.remote_receipt_url = url2
expense2.save!


url3 = "http://res.cloudinary.com/timtheone/image/upload/v1497537935/IMG_7400_jwv7jo.jpg"
expense3 = Expense.new(user_id: 2, date: Date.new(2017,6,1), amount: 459.89,
                      company_id: 1,
                      category_id: 2,
                      credit_card_id: 1)
expense3.remote_receipt_url = url3
expense3.save!

url4 = "http://res.cloudinary.com/timtheone/image/upload/v1497537933/IEN2016000378397_fnsw05.pdf"
expense4 = Expense.new(user_id: 2, date: Date.new(2017,5,29), amount: 11.99,
                      company_id: 1,
                      category_id: 2,
                      credit_card_id: 1)
expense4.remote_receipt_url = url4
expense4.save!

url5 = "http://res.cloudinary.com/timtheone/image/upload/v1497537933/github-looknvote-receipt-2017-03-14_uik5bz.pdf"
expense5 = Expense.new(user_id: 2, date: Date.new(2017,6,13), amount: 7,
                      company_id: 1,
                      category_id: 2,
                      credit_card_id: 1)
expense5.remote_receipt_url = url5
expense5.save!

url6 = "http://res.cloudinary.com/timtheone/image/upload/v1497537935/IMG_7397_tqk2em.jpg"
expense6 = Expense.new(user_id: 2, date: Date.new(2017,5,13), amount: 118,
                      company_id: 1,
                      category_id: 1,
                      credit_card_id: 1)
expense6.remote_receipt_url = url6
expense6.save!

url7 = "http://res.cloudinary.com/timtheone/image/upload/v1497537935/IMG_7397_tqk2em.jpg"
expense7 = Expense.new(user_id: 2, date: Date.new(2017,5,27), amount: 118,
                      company_id: 1,
                      category_id: 1,
                      credit_card_id: 1)
expense7.remote_receipt_url = url7
expense7.save!

url8 = "http://res.cloudinary.com/timtheone/image/upload/v1497537934/IMG_7398_gb0f9b.jpg"
expense8 = Expense.new(user_id: 3, date: Date.new(2017,6,1), amount: 11.52,
                      company_id: 1,
                      category_id: 1,
                      credit_card_id: 1)
expense8.remote_receipt_url = url8
expense8.save!

url9 = "http://res.cloudinary.com/timtheone/image/upload/v1497537934/IMG_7393_rlirqj.jpg"
expense9 = Expense.new(user_id: 3, date: Date.new(2017,4,29), amount: 60.25,
                      company_id: 1,
                      category_id: 1,
                      credit_card_id: 1)
expense9.remote_receipt_url = url9
expense9.save!

url10 = "http://res.cloudinary.com/timtheone/image/upload/v1497537934/IMG_7394_xr4irq.jpg"
expense10 = Expense.new(user_id: 4, date: Date.new(2017,6,1), amount: 110.87,
                      company_id: 1,
                      category_id: 1,
                      credit_card_id: 1)
expense10.remote_receipt_url = url10
expense10.save!

url11 = "http://res.cloudinary.com/timtheone/image/upload/v1497537933/github-looknvote-receipt-2017-02-14_zrmeqf.pdf"
expense11 = Expense.new(user_id: 4, date: Date.new(2017,6,9), amount: 7,
                      company_id: 1,
                      category_id: 2,
                      credit_card_id: 1)
expense11.remote_receipt_url = url11
expense11.save!

url12 = "http://res.cloudinary.com/timtheone/image/upload/v1497537935/invoice89025176_zaegjl.pdf"
expense12 = Expense.new(user_id: 5, date: Date.new(2017,5,25), amount: 119.97,
                      company_id: 1,
                      category_id: 2,
                      credit_card_id: 1)
expense12.remote_receipt_url = url12
expense12.save!


puts "Seeding done"
