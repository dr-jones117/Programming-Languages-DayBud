// Declaring variables with var binds them to be mutable and declaring with let binds them to immutable

// variables are staticially binded much like C, C++, and Java

// This will cause an error
// x = 1.0

var x = 10 // Swift binds at compile time to allow for inference of variables

// Closure is supported by swift
let closure = {print("x is \(x)")}

for i in 0...10 {
    x = i
    closure()
}

// Types are inferred in swift
var y = 1.0
print(type(of: y))
var z = true
print(type(of: z))
// However you can force types by doing var foo: <Type> = bar
// var a: Int = true


// Function Binding

// Using Function Referneces
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let mathFunction: (Int, Int) -> Int = add
let result = mathFunction(3, 4) // Calls the 'add' function via 'mathFunction'
print(result)

// Function Binding using Closure
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
let result2 = incrementByTwo() // result is 2
print(result2)

// Binding to function types
typealias MyCallback = (String) -> Void

let callback: MyCallback = { message in
    print(message)
}

callback("Hello, world")
