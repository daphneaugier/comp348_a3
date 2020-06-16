class Shape
    def initialize
        @status = nil
    end
  
    def print
        if @status.nil?
            p = perimeter().nil? ? "undefined" : perimeter().to_s
            a = area().nil? ? "undefined" : area().to_s
            puts "#{self.class}, Perimeter: " + p + ", area: " + a
        else
            puts @status
        end
    end

    def perimeter
        return nil
    end

    def area
        return nil
    end
end

class Circle < Shape
    include Math
    def initialize(radius = 0)
        @radius = radius
    end

    def perimeter
        return 2 * PI * @radius
    end

    def area
        return @radius * PI**2
    end
end

class Rectangle < Shape
    def initialize(h = 0, w = 0)
        @heigh = h
        @width = w
    end

    def perimeter
    	if @heigh > 0 and @width > 0
        return 2 *@heigh + 2 * @width
       else
       	return 0
       end
    end
    
    def area
        return @heigh*@width
    end
end

class Ellipse < Shape
    include Math
    def initialize(a = 0, b = 0)
        if a<0 or b< 0
            @status = "Error: Invalid Ellipse"
        else
            @a = a
            @b = b
        end 
    end
    def area
        if @a<0 or @b< 0
            @status = "Error: Invalid Ellipse"
            return @status
        else
            return PI * @a * @b
        end
    end
    def eccentricity
        if @a<0 or @b< 0
            @status = "Error: Invalid Ellipse"
            return 0
        else
            return sqrt(@a**2-@b**2)
        end
    end
end


# Unit tests
puts "\nUnit testing values\n===================\n\n"
s = Shape.new
r1 = Rectangle.new(10,20)
r2 = Rectangle.new(0,10)
c = Circle.new(2)
e1 = Ellipse.new(2,4)
e2 = Ellipse.new(-1,4)

s.print
r1.print
r2.print
c.print
e1.print
e2.print

# Question 5
puts "\nThis is Q5\n==========\n\n"

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
    "shapes" => #{@@n_shapes}
    "rectangles" => #{@@n_rectangles}
    "circles" => #{@@n_circles}
    "ellipses" => #{@@n_ellipses}
    }
    puts "Statistics:"
    puts "\tShape(s):" + statistics["shapes"]
    puts "\tRectangle(s):" + statistics["rectangles"]
    puts "\tCircle(s):" + statistics["circles"]
    puts "\tEllipse(s):" + statistics["ellipses"]
end
