# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all # se escribe para que cada vez que corremos $ rails db:seed elimina las categorías existentes y crea otras nuevamente

# # Forma manual de adicionar datos a la db
# Category.create(name: "Shoes")
# Category.create(name: "T-shirt")
# Category.create(name: "Glasses")
# Category.create(name: "Hat")
# Category.create(name: "Shorts")

# A través de un array con hashes
Category.create([
    {name: "Shoes"},
    {name: "T-shirt"},
    {name: "Glasses"},
    {name: "Hat"},
    {name: "Shorts"},
    {name: "Jeans"},
    {name: "Kids"},
    {name: "Woman"},
    {name: "Man"},
    {name: "Other"}
])

## si se va a utilizar una gema
#Faker::ActiveRecord #Crearía unas semillas de datos aleatorios
