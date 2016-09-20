# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
djair = User.create!(name: 'Djair Carvalho', email: 'djaircarvalho.dj7@gmail.com', password: '12345678',  admin:true)
rosa = User.create!(name: 'Rosemberg de Santana', email: 'rosembergdesantana@gmail.com', password: '12345678',  admin:false)


proj2 = Project.create!(name: "DjRo", opening_date: Time.zone.local(2016,7,12,14,0), closing_date: Time.zone.local(2016,10,12,14,0), expected_value: 800 )
proj3 = Project.create!(name: "Topicos Especiais", opening_date: Time.zone.local(2016,7,12,14,0), closing_date: Time.zone.local(2016,11,12,14,0),  expected_value: 800)


proj2.users << djair << rosa
proj3.users << djair << rosa

sp1 = Sprint.create!(name: "Agosto (2016)", opening_date: Time.zone.local(2016,8,1,14,0), closing_date: Time.zone.local(2016,9,1,14,0))
sp2 = Sprint.create!(name: "Setembro (2016)", opening_date: Time.zone.local(2016,9,1,14,0), closing_date: Time.zone.local(2016,10,1,14,0))
sp3 = Sprint.create!(name: "Agosto (2016)", opening_date: Time.zone.local(2016,8,1,14,0), closing_date: Time.zone.local(2016,9,1,14,0))

proj2.sprints << sp1 << sp2
proj3.sprints << sp3
