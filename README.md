# RubyOnRails Health Assessment App
This is a baseline application set up with Ruby 2.5.7 and Rails 6.0. ActiveRecord is backed by a sqlite3 database located in `db/development.sqlite3`.

# Running With Docker
1. `$ docker build -t spring_api_ruby .`
1. `$ docker run -it -p 3000:3000 spring_api_ruby`
1. `curl -X POST http://localhost:3000/assessments`

# Running Without Docker
Requirements:
- Ruby 2.5.7
- Bundler 2

1. `$ bundle install`
1. `$ rails s`
1. `curl -X POST http://localhost:3000/assessments`


## Install

### Clone repository

```shell
git clone
cd project
```

### Check Ruby version

```terminal
ruby -v
```

Install the right ruby version using [rbenv] if it's not the same as below (https://github.com/rbenv/rbenv):

```terminal
rbenv install 2.5.7
```

### Install dependencies

Use [Bundler](https://github.com/bundler/bundler)

```terminal
bundle
```

### Initialize the database

```terminal
rails db:create db:migrate db:seed
```

## Serve

```terminal
rails s
```

visit http://localhost:3000/

## Testing (testing requires seed data)

```terminal
rspec
```

## Next Steps

1. Add conditional logic for questionnaire subsets, ie questionnaire.rb line 47 
2. To use and reference additional questionnaires
  - add questionnaire / questions into database
  - build calculation methods
3. Serialize questionnaires / assessments
4. Add authentication
