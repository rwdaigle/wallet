# Wallet App

Test app mainly used for showing how to deploy apps to Heroku.

## Local setup

Configure PG instance:

```
$ pg_ctl init -D db/postgresql
```

Start PG:

```
$ postgres -D db/postgresql
```

Bootstrap DB.

```
$ createdb wallet_dev
$ bundle exec rake db:migrate
```
