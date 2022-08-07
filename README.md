# README

Para rodar o programa, é necessário usar o ruby versão 2.7.4 e o rails versão 6.1.6.1

Depois disso, use o comando 'bundle' para instalar as dependências e, usando o banco de dados Postgresql, que deve já estar configurado no terminal, faça 'rails db:start' para iniciar o banco de dados, 'rails db:migrate' para realizar as migrações no banco de dados e 'rails s', para rodar o servidor em 'localhost:3000'. 

Para configurar a porta em outro lugar, use 'rails s -p porta', onde "porta" seria o número da porta.

Feito isso, as rotas da api são:

- 'localhost:3000/api/v1/requests/' para index de todos os pedidos
- 'localhost:3000/api/v1/requests/show/:id' para show de um pedido especifico(com o id informado na rota)
- 'localhost:3000/api/v1/requests/create' para criar um novo pedido
- 'localhost:3000/api/v1/requests/update/:id' para atualizar um pedido
- 'localhost:3000/api/v1/requests/status/:id' para atualizar o status de um pedido
- 'localhost:3000/api/v1/requests/delete/:id' para deletar um pedido