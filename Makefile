run:
	@docker-compose up

kill:
	@docker-compose kill

test:
	@docker-compose run --rm web bundle exec rspec $(ARGS)

install:
	@docker-compose run --rm web bundle install

routes:
	@docker-compose run --rm web rails routes

drop:
	@docker-compose run --rm web rake db:drop

create:
	@docker-compose run --rm web rake db:create

migrate:
	@docker-compose run --rm web rake db:migrate

migration:
	@docker-compose run --rm web bundle exec rails generate migration $(ARGS)

seed:
	@docker-compose run --rm web rails db:seed

setup:
	@docker-compose run --rm web rake db:drop db:create

console:
	@docker-compose run --rm web bundler exec rails console

fix:
	@docker-compose run --rm web  bin/rake db:migrate RAILS_ENV=development

serialize:
	@docker-compose run --rm web rails g serializer $(ARGS)
