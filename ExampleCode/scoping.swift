// Swift has local and global scopes and supports nested scoping. The innermost variable shadows the outer one. Local variables are destroyed when leaving the scope.

// The scoping is also lexical so a variable's scope is defined by its position in the code regardless of run time.

let global = "I am global"

func example() {
    let global = "I am local"
    
    print("global says \(global)")
}

example()


// Swift also allows for nested functions
func outerFunc() {
    var global = "I am in the outer"
    
    func innerFunc() {
        // Can mutate the variables one scope up
        global = "I am in the inner"
        print("global says \(global)")
        }
    
    innerFunc()
}

outerFunc()
