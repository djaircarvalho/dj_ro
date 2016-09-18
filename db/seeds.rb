# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
djair = User.create!(name: 'Djair Carvalho', email: 'djaircarvalho.dj7@gmail.com', password: '12345678',  admin:true)
rosa =User.create!(name: 'Rosemberg de Santana', email: 'rosembergdesantana@gmail.com', password: '12345678',  admin:false)
