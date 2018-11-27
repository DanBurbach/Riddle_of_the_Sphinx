require ('sinatra')
require ('sinatra/reloader')

get ('/') do
  @description = "this application will determine if the dimensions make a triangle, and if so, which kind."
  # just testing
  # thing = 2 + 2
  # @other_thing = thing.to_s + "ok"
  erb(:input)
end

post ('/output') do
  @first_length = params.fetch("first_length")
  x = params.fetch("first_length").to_i
  @second_length = params.fetch("second_length")
  y = params.fetch("second_length").to_i
  @third_length = params.fetch("third_length")
  z = params.fetch("third_length").to_i

    if (x==0) || (y==0) || (z==0)
      @triangle = "NOT a triangle, use whole numbers!"
    elsif (x == y) && (y == z)
      @triangle = "equilateral"
    elsif ((x == y) && (x+y>z)) || ((y == z) && (y+z>x)) || ((x == z) && (x+z>y))
      @triangle = "isoceles"
    elsif (x != y) && (y != z)
      @triangle = "scalene"
    elsif (x + y <= z) || (x + z <= y) || (y + z <= x)
      @triangle = "NOT a triangle!"
    end
  erb(:output)
end
