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
  name: "Le Wagon",
  },

  {
  name: "Anatole",
  },
  {
  name: "Apple",
  }
]

user_seed = [
  {
  first_name: "Tim",
  last_name: "Almamedov",
  email: "tim.almamedov@gmail.com",
  company_id: 1,
  password: "password",
  password_confirmation: "password",
  admin: true
  },

  {
  first_name: "John",
  last_name: "Dawson",
  company_id: 1,
  email: "john.dawson@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: false
  },

  {
  first_name: "Nicolas",
  last_name: "Peltier",
  company_id: 1,
  email: "nicolas.peltier@me.com",
  password: "password",
  password_confirmation: "password",
  admin: true
  },

  {
  first_name: "Peter",
  last_name: "Drucker",
  company_id: 2,
  email: "peter.drucker@me.com",
  password: "password",
  password_confirmation: "password",
  admin: true
  },
  {
  first_name: "Peter",
  last_name: "Thiele",
  company_id: 2,
  email: "peter.Thiele@me.com",
  password: "password",
  password_confirmation: "password",
  admin: true
  },
  {
  first_name: "David",
  last_name: "Allen",
  company_id: 3,
  email: "david.allen@me.com",
  password: "password",
  password_confirmation: "password",
  admin: true
  }
]

credit_card_seed = [
  {
  number: "1111 2222 3333 4444",
  credit_card_type: "Visa",
  status: "active",
  company_id: 1,
  billing_day: 20
  }
]

category_seed = [
  {
  name: "Restaurant",
  company_id: 1
  },
  {
  name: "Software",
  company_id: 1
  },
  {
  name: "Travels",
  company_id: 1
  }
]

expense_seed = [
  {
  user_id: 1,
  date: "10/10/2017",
  amount: 123,
  company_id: 1,
  category_id: 1,
  credit_card_id: 1

  },
  {
  user_id: 2,
  date: "10/11/2017",
  amount: 133,
  company_id: 1,
  category_id: 2,
  credit_card_id: 1

  }
]

Company.create!(company_seed)
User.create!(user_seed)
CreditCard.create(credit_card_seed)
Category.create!(category_seed)
Expense.create!(expense_seed)


puts "Seeding done"
