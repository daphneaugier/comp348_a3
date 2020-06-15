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

File.readlines('input').each do |line|
    vars = line.split
    # Create instance with object name as first string read in line
    instance = Kernel.const_get(vars[0].capitalize).new
    if vars.length > 1
        case vars[0]
        when "circle"
        instance.instance_variable_set(:@radius, vars[1].to_f)
        when "rectangle"
        instance.instance_variable_set(:@heigh, vars[1].to_f)
        instance.instance_variable_set(:@width, vars[2].to_f)
        when "ellipse"
        instance.instance_variable_set(:@a, vars[1].to_f)
        instance.instance_variable_set(:@b, vars[2].to_f)
        end
    end

    # vars.each_with_index do |var, i|
    #     if i == 0
    #         # Create instance of object read in file
    #         instance = Kernel.const_get(var.capitalize).new
    #         puts "Instance #{var} created"
    #     else
    #         instance.instance_variables.each do |v|
    #             # do something
    #         end
    #     end
    #     puts "\t "+var + " " + i.to_s
    # end

    # call print method to object instance created
    instance.print
end
