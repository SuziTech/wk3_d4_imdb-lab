require_relative("../db/sql_runner")
# require_relative("../models/casting")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies
    (
      title,
      genre,
      budget
      )
      VALUES (
        $1, $2, $3
      )
      RETURNING id
      "
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end

  def stars
    sql = "SELECT stars.* FROM stars
          INNER JOIN castings
          ON castings.star_id = stars.id
          WHERE movie_id = $1
          "
    values = [@id]
    stars_data = SqlRunner.run(sql, values)
    stars = stars_data.map {|star_data| Star.new(star_data)}
    return stars
  end

  def movie_budget
    sql = "SELECT budget FROM movies WHERE id = $1"
    values = [@id]
    movie_budget_data = SqlRunner.run(sql, values)
    movie_budget = movie_budget_data.map {|movie_budget_data| Movie.new(movie_budget_data)}
    return movie_budget
  end

  def movie_stars_fees()
    sql = "SELECT SUM (fee) AS total FROM castings
            WHERE movie_id = $1
            "
    values = [@id]
    total_stars_fees_data = SqlRunner.run(sql, values)
    return total_stars_fees_data[0]['total'].to_i
    # total_stars_fees = total_stars_fees_data.map {|total_stars_fees_data| Casting.new(total_stars_fees_data)}
    # return total_stars_fees
  end

  def remaining_movie_budget
    initial_budget = self.movie_budget
    # castings = self.castings()
    movie_fees = self.movie_stars_fees()
    return initial_budget - movie_fees
  end


end
