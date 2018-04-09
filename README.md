# PDvend

Application of test for work

* Set subdomain(`127.0.0.1 api.pdvend.test`) in local machine!

`macOS`: `/private/etc/hosts`

`Linux`: `/etc/hosts`

## Versions

Ruby:
  `2.4.0`

Rails:
  `5.0.0.1`

Database:
  `Postgres9`

## Installation

Assuming you already have the environment properly configured on your machine after cloning the project do:

```
$ cd pdvend
```

And install dependencies:
```
$ bundle install
```

Configuring the database:

```
$ rails db:create db:migrate db:seed
```

Run the tests:
```
$ bundle exec rspec
```
Start server:
```
$ rails s
```

## Docker usage

builder installation:
```
$ docker-compose build
```
Database setup:

```
$ docker-compose run --rm web rails db:create db:migra db:seed
```

Start server:
```
$ docker-compose up
```

## Usage

#### Create a Product

Send `POST` request with that params to `/products` path

```
name           :string(120)      not null
description    :string(65535)`
product_value  :decimal(12, 2)
height         :float            not null
weight         :float            not null
width          :float            not null
product_length :float            not null
created_at     :datetime         not null
updated_at     :datetime         not null
```

Postman example:
```
{
  "product": {
    "name": "Awesome Product",
    "description": '\o/ PDvend',
    ....
  }
}
```

#### To calculate the freight

Send POST request search params to `/products/search` path

Postman example
:
```
{
	"search" : {
		"id" : 1,
		"zip_code_origin": "85253100", or "85253-100"
		"zip_code_dinatation": "64020350" or "64020-350"
	}
}
```

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


Done with :coffee:
