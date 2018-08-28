# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(:username => 'aaa',
                :email => 'a@a.a',
                :password => 'password'
)
user.skip_confirmation!
user.save

user = User.new(:username => 'bbb',
                :email => 'b@b.b',
                :password => 'password'
)
user.skip_confirmation!
user.save

user = User.new(:username => 'ccc',
                :email => 'c@c.c',
                :password => 'password'
)
user.skip_confirmation!
user.save

Item.create(
    :title => 'portfolio1',
    :url => 'https://f01portfolio.herokuapp.com/',
    :overview => 'ポートフォリオ管理',
    :detail => 'ポートフォリオ管理のポートフォリを',
    :public => true,
    :user_id => User.first
)
Item.create(
    :title => 'portfolio2',
    :url => 'https://f01portfolio.herokuapp.com/',
    :overview => 'ポートフォリオ管理',
    :detail => 'ポートフォリオ管理のポートフォリを',
    :public => false,
    :user_id => User.first
)
Item.create(
    :title => 'portfolio3',
    :url => 'https://f01portfolio.herokuapp.com/',
    :overview => 'ポートフォリオ管理',
    :detail => 'ポートフォリオ管理のポートフォリを',
    :public => true,
    :user_id => User.first
)
