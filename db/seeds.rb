# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
    :email                 => "admin@dispostable.com",
    :password              => "123456",
    :password_confirmation => "123456",
    :role                  => "admin",
    :confirmed_at          => DateTime.now

)
user.skip_confirmation!
user.save!

user = User.new(
    :email                 => "buyer@dispostable.com",
    :password              => "123456",
    :password_confirmation => "123456",
    :role                  => "buyer",
    :confirmed_at          => DateTime.now

)
user.skip_confirmation!
user.save!