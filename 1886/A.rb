def solve
  t = gets.to_i
  
  t.times do
    n = gets.to_i
    if n <= 6 || n == 9
      puts 'NO'
    elsif (n - 3) % 3 != 0 
      puts "YES\n1 2 #{n - 3}"
    else
      puts "YES\n 1 4 #{n - 5}"
    end
  end
end

solve
