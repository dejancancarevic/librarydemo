1..3.times do |a|
  u = University.create(name: "University #{a}")
  puts "University #{u.name} seeded"

  1..3.times do |b|
    f = Faculty.create(university: u, name: "Faculty #{a} #{b}")
    puts "Faculty #{f.name} seeded"

    1..3.times do |c|
      l = StudentLibrary.create(faculty: f, name: "Library #{a} #{b} #{c}")
      puts "Library #{l.name} seeded"

      1..3.times do |d|
        k = Book.create(student_library: l, name: "Book #{a} #{b} #{c} #{d}")
        puts "Book #{k.name} seeded"
      end

    end
  end
end