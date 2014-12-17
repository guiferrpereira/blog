require "benchmark"

user = User.create(first_name: 'Ana', last_name: 'Meireles', age: 30, email: 'ana.meireles@gmail.com')

time = Benchmark.measure do
	9_000.times do
  	user.full_name
	end
end

time_2 = Benchmark.measure do
	9_000.times do
  	user.full_name_2
  end
end

puts "Postgres Cache: \n"
puts time

puts "Rails Cache: \n"
puts time_2