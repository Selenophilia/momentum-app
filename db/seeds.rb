# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Author.create(author_name: 'first_author')
   
# Tag.create(name: 'sample_tag')     

Quote.create(description: 
    'Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do 
    eiusmod tempor incididunt ut labore et dolore
    magna aliqua. Ut enim ad minim veniam, quis
    nostrud exercitation ullamco laboris nisi ut 
    aliquip ex ea commodo consequat.',
    author_id: 1)

QuotationTag.create(tag_id:1 , quote_id:18)