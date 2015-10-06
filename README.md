# Misingo

This is a Ruby on Rails projects and it has the following external dependencies:

- Ruby version 2.2.2
- Rails version 4.2.4

#### Dependencies

For a full list of dependencies, check the Gemfile, however here are some
highlights:

- Database: PostgreSQL with ActiveRecord
- Template Engine: Erb / Sass
- Testing Framework: RSpec

#### Installation

1.  Run `bundle install`
2.  `cp config/database.yml.template config/database.yml`
3.  Run `rake db:setup && rake db:migrate`
4.  Run `rails s`


#### Generate initial data

1. Create an administrator: `rake seed:admin`. This will generate an admin user with email:  "admin@example.comm", password: "adminpass"
2. Create pet breeds: `rake seed:breeds`
3. Create provinces: `rake seed:provinces`
4. Create lost pets: `rake seed:lost_pets`
