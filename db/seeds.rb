# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Category.destroy_all
tables = ['products', 'categories']
start_id = 1
tables.each do |table|
  ActiveRecord::Base.connection.execute(
    "ALTER SEQUENCE #{table}_id_seq RESTART WITH #{start_id}")
end
  cat = Category.create!(title: 'Book1')
  books = [
    {title: 'Book1', description: 'Description1', price: 12, category_id: cat.id},
    {title: 'Book2', description: '2Description1', price: 13, category_id: cat.id},
    {title: 'Book3', description: '4Description1', price: 15, category_id: cat.id},
    {title: 'Book4', description: '3Description1', price: 17, category_id: cat.id}
  ]
  books.each{ |book| Product.create! book }
