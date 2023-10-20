// Iteration works similar to python where we can iterate just about any sequence but also has do-whiles

var x = 1...10
for i in x {
    print("for sequence i is \(i)")
}

// Standard for loop is simliar to python
for j in 1...5 {
    print("for j is \(j)")
}

// Able to iterate through lists
let colors = ["red", "blue", "green"]

for k in colors {
    print("for each array k is the color \(k)")
}

// Mixed arrays not as pretty as python but doable
let mixedArray: [Any] = [1, "two", 3.0, true]

for item in mixedArray {
    print("item is \(item)")
}

let vals = 1...20

// Can set a conditional to only run the body when met
for i in vals where i%2 != 0 {
    print("conditional for i is \(i)")
}

print("Mixed array is \(mixedArray)")
for i in mixedArray where !(i is Int) {
    print("conditional_2 for i is \(i)")
}
// Can set a step to iterate at an interval
for i in stride(from:0 , to: 25, by: 5) {
    
    print("for stride i is \(i)")
}

var count = 0, end = 20

// The do-while
repeat {
    print("count is \(count)")
    count = count + 1
} while (count < end)

count = 0

// Plain while loop
while(count < end)
{
    print("while count \(count)")
    count = count + 1
}
