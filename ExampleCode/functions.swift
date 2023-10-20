/*
            FUNCTIONS
*/

// Functions are specified with func. Type name must be inside the input parameters
// and return type is specified with an arrow to datatype after declaration.

func greet(name: String) -> String {
    return "Hello, \(name)!"
}

let greeting = greet(name: "Howard")
print(greeting)

func multiply(x: Int, y: Int) -> Int {
    return x * y
}

print("Please input an integer: ")
var x = Int(readLine()!)!           // Reading in input must specify type
print("Please input another integer: ")
var y = Int(readLine()!)!           // Will convert the string from readLine to int
var product = multiply(x:x, y:y)
print("\(x) * \(y) = \(product)")
