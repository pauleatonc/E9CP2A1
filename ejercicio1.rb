class Table
  def initialize(mesa, day1, day2, day3, day4)
    @mesa = mesa
    @day1 = day1.to_i
    @day2 = day2.to_i
    @day3 = day3.to_i
    @day4 = day4.to_i
  end

  def max_by_table
    d = [@day1, @day2, @day3, @day4]
    d_max = d.max
    d_val = d.index(d_max) + 1
    print "Mayor recaudacion por mesa\n"
    print "Mesa nombre: #{@mesa}, "
    print "mayor recaudacion dia: #{d_val} "
    print "por un valor de: #{d_max}\n"
  end

  def to_s
  "#{@mesa}: #{@day1}, #{@day2}, #{@day3}, #{@day4}"
  end

  def average
    (@day1 + @day2 + @day3 + @day4) / 4.0
  end

end

def open_table
  objeto = []
  file = File.read('casino.txt')
  file.split("\n").each do |linea|
    campos = linea.split(', ')
    objeto << Table.new(campos[0], campos[1], campos[2], campos[3], campos[4])
  end
  objeto
end

puts open_table
open_table.each { |mesa| puts mesa.average }
open_table.each {|mesa| print mesa.max_by_table}
