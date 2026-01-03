def solve
  cnt = gets.chomp.to_s.chars.uniq.count
  puts cnt.even? ? "CHAT WITH HER!" : "IGNORE HIM!"
end

solve
