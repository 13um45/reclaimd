# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Product.create! id: 1, name: "shirt", price: 100, quantity: 10, brand: "chrome", material: "cotton",
description: "loren ipsum"
Product.create! id: 2, name: "pant", price: 100, quantity: 10, brand: "levis", material: "cotton",
description: "loren ipsum"
Product.create! id: 3, name: "shoes", price: 100, quantity: 10, brand: "nike", material: "cotton",
description: "loren ipsum"
