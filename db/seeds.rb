u = User.create!(email: "djaircarvalho.dj7@gmail.com", password:"12345678" , admin: true, name: "Djair Carvalho" )
u1 = User.create!(
  email: "rosembergdesantana@gmail.com", password:"12345678", admin: false, name: "Rosemberg de Santana")

p = Project.create!(
  name: "Dj_Ro", opening_date: "2016-07-21", closing_date: "2016-09-27", expected_value: 600)

p.users << [u, u1]

s1 = Sprint.create!(
  name: "Agosto", opening_date: "2016-07-21", closing_date: "2016-08-21", project: p, value:250
)


s2 = Sprint.create!(name: "Setembro", opening_date: "2016-08-22", closing_date: "2016-09-27", project: p, value:350 )
Task.create!([
  {title: "Brainstorming", description: "Deve ser realizado brainstorming para elencar os pontos a serem levados em consideração para o desenvolvimento da ferramenta.", estimated_time: 120, time_spent: 130, sprint: s1, status: "finished", started_in: "2016-07-29 14:12:54", finished_in: "2016-07-29 14:12:54", user: u },
  {title: "Preparar Modelo", description: "Deve ser criado o  documento de requisitos ( modelo preliminar, diagrama de caso de uso e diagrama de classes)", estimated_time: 360, time_spent: 320, sprint: s1, status: "finished", started_in: nil, finished_in: "2016-08-06 14:12:54", user: u },
  {title: "Iniciar o desenvolvimento do sistema", description: "Iniciar Projeto (rails new),\r\niniciar o repositório git,\r\nconfigurar o devise ( gem de autenticação),\r\nGerar scaffolding  de Team,\r\nGerar scaffolding Project,\r\nGerar scaffolding Sprint(ciclo),\r\nGerar scaffolding Task", estimated_time: 360, time_spent: 360, sprint: s1, status: "finished", started_in: nil, finished_in: "2016-08-03 14:12:54", user: u1 },
  {title: "Adicionar relacionamentos", description: "Adicionar many_to_many entre user e team,\r\n\r\nadicionar many_to_many entre user e project,\r\n\r\nadicionar has_many de project para sprint e belongs_to no sentido contrario,\r\n\r\nadicionar belongs_to de task para sprint e o has_many no sentido contrario,\r\n\r\ntestar os relacionamentos (pelo menos no rails console)", estimated_time: 120, time_spent: 140, sprint: s1, status: "finished", started_in: nil, finished_in: "2016-08-03 14:12:54", user: u },
  {title: "Configurar a gem do bootstrap", description: "Deve ser configurada a gem do bootstrap.", estimated_time: 30, time_spent: 40, sprint: s1, status: "finished", started_in: nil, finished_in: "2016-08-03 14:12:54", user: u },
  {title: "Exibir todos os projetos na pagina inicial do usuario", description: "Deve ser considerado o root do projeto para exibir todos os projetos na pagina inicial do usuario", estimated_time: 120, time_spent: 100, sprint: s1, status: "finished", started_in: nil, finished_in: "2016-08-04 14:12:54", user: u1 },
  {title: "Adicionar Menu superior", description: "Deve ser adicionado um menu suprerior para apresentar acesso rápido as funcionalidades do sistema.", estimated_time: 60, time_spent: 80, sprint: s1, status: "finished", started_in: nil, finished_in: "2016-08-04 14:12:54", user: u1 },
  {title: "Modificar routes.rb para implementação aninhada", description: "As rotas devem estar disponiveis no formato projects/id_project/sprint/id_sprint/tasks/id_task.", estimated_time: 10, time_spent: 10, sprint: s2, status: "finished", started_in: nil, finished_in: "2016-08-10 14:12:54", user: u1 },
  {title: "Corrigir views de project para novo modelo aninhado", description: "Devem ser corrigidos as chamadas a links em todas as views.", estimated_time: 360, time_spent: 360, sprint: s2, status: "finished", started_in: nil, finished_in: "2016-08-11 14:12:54", user: u },
  {title: "Corrigir views de sprint para novo modelo aninhado", description: "Corrigir todas as referencias a sprints para o novo modelo de routes", estimated_time: 240, time_spent: 240, sprint: s2, status: "canceled", started_in: nil, finished_in: "2016-08-10 14:12:54", user: u },
  {title: "Corrigir views de task para novo modelo aninhado", description: "Corrigir todas as referencias à tasks para o novo modelo de rotas", estimated_time: 240, time_spent: 240, sprint: s2, status: "finished", started_in: nil, finished_in: "2016-08-11 14:12:54", user: u },
  {title: "Adicionar campo admin em user", description: "Adicionar o campo admin do tipo boolean no modelo de user para indicar se o mesmo eh administrador.", estimated_time: 20, time_spent: 20, sprint: s2, status: "homologating", started_in: nil, finished_in: "2016-08-12 14:12:54", user: u },
  {title: "Adicionar gem do pundit e configura-la", description: "Estudar a documentação da gem pundit e configura-la no projeto", estimated_time: 40, time_spent: 40, sprint: s2, status: "finished", started_in: nil, finished_in: "2016-08-13 14:12:54", user: u },
  {title: "configurar autotização de  projetos", description: "configurar autotização de usuario para que apenas admin possa criar e gerenciar projetos", estimated_time: 30, time_spent: 30, sprint: s2, status: "finished", started_in: nil, finished_in: "2016-08-14 14:12:54", user: u1 },
  {title: "configurar autotização de  sprints", description: "configurar autotização de usuario para que apenas admin possa criar e gerenciar sprints.", estimated_time: 30, time_spent: 30, sprint: s2, status: "stoped", started_in: nil, finished_in: "2016-08-14 14:12:54", user: u },
  {title: "configurar autotização de  tarefas", description: "configurar autotização de usuario para que apenas admin possa criar e gerenciar tarefas", estimated_time: 30, time_spent: 30, sprint: s2, status: "canceled", started_in: nil, finished_in: "2016-08-14 14:12:54", user: u },
  {title: "Adicionar status em task", description: "Adicionar enum para representar a situação da tarefa.", estimated_time: 10, time_spent: 10, sprint: s2, status: "finished", started_in: nil, finished_in: "2016-09-25 14:12:33", user: u }
])
