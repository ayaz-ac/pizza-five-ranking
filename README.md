<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1280px-Ruby_On_Rails_Logo.svg.png" width="400" alt="laravel-logo">
  <h1>Pizza Five Ranking 🍕</h1>
  <p>Pizza rating app made with RubyOnRails.</p>
</div>

# README

## Pre-requisites

- Ruby 2.7.3 (preferably installed with a Ruby version manager such as RVM)
- Rails 6.0.3.2

## Quickstart

Install dependencies:
```
bundle
yarn install --check-files
```
Create and setup databases (PostgreSQL):
- Change root password to `root`
```
rails db:setup
```
Check everything is properly installed and setup:
```
rails test
```
Run the application:
```
rails s
```

Open the app:
http://localhost:3000
