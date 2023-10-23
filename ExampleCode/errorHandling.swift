//Gavin Bialas
//Error Handling Basics

enum DivisionError: Error {
  case dividedByZero
}

//throws is needed for error handling
func division(numerator: Int, denominator: Int) throws {

// throw error if divide by 0
  if denominator == 0 {
    throw DivisionError.dividedByZero
  }
  else {
    let result = numerator / denominator
    print(result)
  }
}

//examples of error catching
do {
    try! division(numerator: 10, denominator: 5)
    try division(numerator: 10, denominator: 5)
    try division(numerator: 10, denominator: 0)
}
catch DivisionError.dividedByZero {
  print("divide by 0 error")
}
