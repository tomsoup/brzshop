# Installation

The application requires Rails 5.2 and Postgresql.

A link to the [heroku](https://still-ravine-22515.herokuapp.com/orders) project has been provided have a glance at the order page.

To start the dev server, please enter the command below.

```sh
$ bundle install
$ rails db:create db:migrate
$ rails s
```

#### Task 1: Seed Customers, Products and Orders

The first task can be viewed by running

```sh
$ rails db:seed
``` 
#### Task 2: Create View for orders

To visit the order page when the developer server is running, please visit [localhost:3000/orders](localhost:3000/orders) in your browser

#### Task 3: Tests

1. If the price of one product change, the price in the cart stay as the original
2. If the cart still unpaid, and the quantity of some LineItem change, the Price of Cart must be updated.

The application using rspec-rails for testing.  The two scenarios above can be tested by running rpsec in terminal

```sh
$ rspec
``` 