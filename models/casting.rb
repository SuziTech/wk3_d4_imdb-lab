require_relative("../db/sql_runner")
require_relative("movie")
require_relative("star")

class Casting

  attr_reader :id
  attr_accessor :fee, :movie_id, :star_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO castings
    (
      movie_id,
      star_id,
      fee
      )
      VALUES (
        $1, $2, $3
      )
      RETURNING id
      "
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    values = []
    SqlRunner.run(sql, values)
  end

  # def self.movie_stars_fees()
  #   sql = "SELECT SUM (fee) AS total FROM castings
  #           WHERE movie_id = $1
  #           "
  #   values = [@id]
  #   total_stars_fees_data = SqlRunner.run(sql, values)
  #   total_stars_fees = total_stars_fees_data.map {|total_stars_fees_data| Casting.new(total_stars_fees_data)}
  #   return total_stars_fees
  # end






end
