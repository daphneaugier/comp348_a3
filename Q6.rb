puts "\nThis is Q6, a modified version of Q5\n==========\n\n"

#introducing variables for counting
@@n_shapes = 0
@@n_rectangles = 0
@@n_circles = 0
@@n_ellipses = 0

File.readlines('Q5input').each do |line|
    vars = line.split
    # Create instance with object name as first string read in line
    instance = Kernel.const_get(vars[0].capitalize).new
    if vars.length > 1
        case vars[0]
        when "shape"
        @@n_shapes += 1
        when "circle"
        instance.instance_variable_set(:@radius, vars[1].to_f)
        @@n_shapes += 1
        @@n_circles += 1
        when "rectangle"
        instance.instance_variable_set(:@heigh, vars[1].to_f)
        instance.instance_variable_set(:@width, vars[2].to_f)
        @@n_shapes += 1
        @@n_rectangles += 1
        when "ellipse"
        instance.instance_variable_set(:@a, vars[1].to_f)
        instance.instance_variable_set(:@b, vars[2].to_f)
        @@n_shapes += 1
        @@n_ellipses += 1
        end
    end
    instance.print
    
    #Hash
    statistics = {   
    "shapes" => #{@@n_shapes},
    "rectangles" => #{@@n_rectangles},
    "circles" => #{@@n_circles},
    "ellipses" => #{@@n_ellipses}
    }
    puts "Statistics:"
    puts "\tShape(s):" + statistics["shapes"]
    puts "\tRectangle(s):" + statistics["rectangles"]
    puts "\tCircle(s):" + statistics["circles"]
    puts "\tEllipse(s):" + statistics["ellipses"]
end
