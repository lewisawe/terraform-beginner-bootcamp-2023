# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for runy.
It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

https://sinatrarb.com/

## Terratowns Mock Server

### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.

## Created a custom Provider using GO langauge 
https://www.hashicorp.com/blog/writing-custom-terraform-providers

From the article above, some possible reasons to create a custom provider are: 

There are a few possible reasons for authoring a custom Terraform provider, such as:

    - An internal private cloud whose functionality is either proprietary or would not benefit the open source community.

    - A "work in progress" provider being tested locally before contributing back.

    - Extensions of an existing provider


## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete

https://en.wikipedia.org/wiki/Create,_read,_update_and_delete

## Setting Terraform variables via env vars

use 
```
export TF_VAR_terratowns_access_token="example-token-1234-4567"
export TF_VAR_teacherseat_user_uuid="example-uuid-1234-4567"
```
