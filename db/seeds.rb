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

sp1 = Sprint.create!(name: "Agosto (2016)", opening_date: Time.zone.local(2016,8,1,14,0), closing_date: Time.zone.local(2016,9,1,14,0), project: proj2)
sp2 = Sprint.create!(name: "Setembro (2016)", opening_date: Time.zone.local(2016,9,1,14,0), closing_date: Time.zone.local(2016,10,1,14,0), project: proj2)
sp3 = Sprint.create!(name: "Agosto (2016)", opening_date: Time.zone.local(2016,8,1,14,0), closing_date: Time.zone.local(2016,9,1,14,0), project: proj3)

lorem1 = "É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de Conteúdo aqui, conteúdo aqui, fazendo com que ele tenha uma aparência similar a de um texto legível."
lorem2 = "Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por 'lorem ipsum' mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero)."

20.times do |i|
  sp1.tasks.create!(title: "SP1 - Task #{ i + 1}" , description: (i % 2 == 0) ? lorem1 : lorem2, estimated_time:  (i % 2 == 0) ? 120 : 180 )
  sp2.tasks.create!(title: "SP2 - Task #{ i + 1}" , description: (i % 2 == 0) ? lorem1 : lorem2, estimated_time:  (i % 2 == 0) ? 120 : 180 )
  sp3.tasks.create!(title: "SP3 - Task #{ i + 1}" , description: (i % 2 == 0) ? lorem1 : lorem2, estimated_time:  (i % 2 == 0) ? 120 : 180 )
end

proj2.sprints << sp1 << sp2
proj3.sprints << sp3
