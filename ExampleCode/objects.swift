// Define a base class
class Shape {
    static var staticProperty: Int = 13
    var name: String

    //construction
    init(name: String) {
        self.name = name
    }

    func area() -> Double {
        return 0.0
    }
}

// Define a class that inherits from the base class
class Circle: Shape {
    var radius: Double

    init(name: String, radius: Double) {
        self.radius = radius
        super.init(name: name)
    }

    override func area() -> Double {
        return Double.pi * radius * radius
    }
}

let shape = Shape(name: "Unknown Shape")
let myCircle = Circle(name: "Circle", radius: 5.0)

print("Name of shape: \(shape.name)")
print("Name of the circle: \(myCircle.name)")
print("Radius of the circle: \(myCircle.radius)")
print("Area of the circle: \(myCircle.area())")
print("Static Property: \(Shape.staticProperty)")
