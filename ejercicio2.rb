require 'date'

class Course
  def initialize(clase, firstdate, finaldate)
    @clase = clase
    begin
      @firstdate = Date.parse(firstdate)
      @finaldate = Date.parse(finaldate)
    rescue ArgumentError => e
      print "Ocurrio el siguiente error en #{e}"
    end
  end

   def start_before(date)
     if date >= Date.parse('01/01/2019')
       raise 'La fecha ingresada es incorrecta'
     else
       @firstdate < date
     end
   end

    def start_after(date)
     if date >= Date.parse('01/01/2019')
       raise 'La fecha ingresada es incorrecta'
     else
       @firstdate > date
     end
   end

   def to_s
     "#{@clase}: #{@firstdate},#{@finaldate}"
   end
end

def open_course
  objeto = []
  file = File.read('cursos.txt')
  file.split("\n").each do |linea|
    campos = linea.split(', ')
    objeto << Course.new(campos[0], campos[1], campos[2])
  end
  objeto
end

t = open_course
ahora = Date.today
futura = Date.today + (2 * 365)

print "#{t}\n"
print t.first.start_before ahora
print "#{t}\n"
print t.first.start_after ahora
begin
  print t.first.start_before futura
rescue StandardError cueck
  print "#{cueck}\n"
end
