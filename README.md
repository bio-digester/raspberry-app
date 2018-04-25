# README

# Instruções

## Dependencias do Projeto

* Ruby 2.5.0

* Rails 5.2.0

* Postgre 9.6

## Passo a Passo:

Siga as instruções https://rvm.io/ para instalar o rvm

Instalando o ruby usando rvm

```$ rvm install 2.5.0```

Instalando o rails

```$ gem install rails ```

Instalando dependencias do projeto (execute dentro da pasta do projeto !)

```bundle install```

Configurando o banco:

Acesse o banco postgres com o usuário padrão postgres:

```sudo -u postgres psql```

Crie um usuario para manipular o banco:

```create role raspberry_user with createdb password 'raspberry' login;```

Crie o banco, setando como owner o usuário criado anteriormente:

```create database raspberry_db with owner raspberry_user encoding "unicode";```

Saia do postgre e faça a migração das tabelas:

```rake db:migrate```

Populando o banco com dados Fake

```rake db:seed```

Executando o projeto

```rails s```

Acesse a aplicação em localhost:3000
