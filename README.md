# README

Projeto experimental usando rails 7 e novo padrão de workflow com o turbo + stimulus js.

#### Business Logic
Sistema com gerenciamento compartilhado de livros.

Primeiros passos do usuário: 
- Usuário criará um login in /sign_up
- Na home, o usuário poderá adicionar/excluir/favoritar livros
- Acesso a página de favoritos 

Usuário anônimo:
- Pode visualizar e buscar livros


#### Ruby version
ruby 3.1.0

#### System dependencies
- sqlite3
- bundler
- ruby 

#### Configuration
- bundle install
- rails db:create db:migrate
- rails s

#### Database creation
Rodar as tasks de criação do rails.

#### How to run the test suite
- rspec
- Para checar a cobertura de testes: coverage/index.html

#### Deployment instructions
- Ambiente dev: Rodar o rails server 

#### Architecture
O projeto utiliza a arquitetura básica de MVC. 
Nenhuma operação complexa é demanda, por isso, 
os métodos do active_model e active_record são 
suficientes para essa estrutura. Em caso de novas 
implementações, o pattern services pode 
ser utilizado para operações mais complexas envolvendo 
usuários e livros.

Os Uploads de arquivos são controlados pela integração 
com o carrierwave. O pattern uploads é utilizado para 
integração com models e outros.

O frontend é construído utilizando o padrão do rails 7, 
turbo + stimulus js. Os controllers stimulus estão
dispostos em javascript/controllers. Praticamente, todos
os requests são feitos em formato turbo_stream, isso
faz com que a página seja mais rápida e interativa.

O estilo das páginas é formado pelo framework css Materialize. 
Algumas correções de css foram necessárias, ver application.css. 
Incompatibilidades com o turbo e links ordinários são comuns.

O projeto foi testado com cobertura de 100% do código com o RSpec.
A maior parte dos testes foi escrito em feature test.
O capybara é a engine responsável pela manipulação das páginas.

#### TODO
- testes de controller
- testes de helpers
- unit testes para os partials 
- corrigir falhas intermitentes nos testes de integração da página home
- utilizar o webpacker ou importmap para incluir o materialize
- adicionar docker 
