require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

require('pry')


movie1 = Movie.new({'title' => 'Star Wars', 'genre' => 'Space Adventure', 'budget' => 250000})
movie1.save

movie2 = Movie.new({'title' => 'A Fistfull of Dollars', 'genre' => 'Spagetti Western', 'budget' => 250000})
movie2.save

movie3 = Movie.new({'title' => 'Dirty Harry', 'genre' => 'Detective Drama', 'budget' => 250000})
movie3.save

star1 = Star.new({'first_name' => 'Harrison', 'last_name' => 'Ford'1})
star1.save

star2 = Star.new({'first_name' => 'Carrie', 'last_name' => 'Fisher'})
star2.save

star3 = Star.new({'first_name' => 'Clint', 'last_name' => 'Eastwood'})
star3.save

star4 = Star.new({'first_name' => 'Kate', 'last_name' => 'Winslet'})
star4.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 50000})
casting1.save

casting2 = Casting.new({'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => 30000})
casting2.save

casting3 = Casting.new({'movie_id' => movie2.id, 'star_id' => star3.id, 'fee' => 10000})
casting3.save

casting4 = Casting.new({'movie_id' => movie2.id, 'star_id' => star4.id, 'fee' => 5000})
casting4.save

casting5 = Casting.new({'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => 15000})
casting5.save

binding.pry
nil
