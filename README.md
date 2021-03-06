# Jungle
## A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

As a student of LHL I worked on implimenting many features, bug fixes, and testing following the expectations and requirements given by LHL.

This project was meant to demonstrate the workflow of being a developer in a work-environment, learning and gathering experience towards a new language
and putting my skills as a developer to the test.

## Images
### User
#### Home
![image](https://user-images.githubusercontent.com/64753034/142506265-04df5922-77d5-455b-a4f8-9f34e06e606d.png)
#### Cart
![image](https://user-images.githubusercontent.com/64753034/142506242-fec1be6a-1294-470f-8b6f-8bcbd9948b13.png)
### Admin
#### Home
![image](https://user-images.githubusercontent.com/64753034/142506895-99c29e3b-abca-4e66-b310-6aeb4f6f874a.png)
#### Admin-products
![image](https://user-images.githubusercontent.com/64753034/142506375-fe7150e7-3cdf-4950-b901-81879d769ad3.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

### Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
