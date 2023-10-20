//Importing & Directives

// In Swift you can only import module, 
// e.g. any framework like UIKit, MapKit as below. 
// You cannot import swift classes.

//example of basic importing
import Foundation
import MapKit

// example of conditional importing
#if canImport(UIKit)
import UIKit
#endif

#if !DEBUG
    print("We are not debugging!")
#endif

#warning("This is a warning")
// you also throw errors, which will stop the program
// #error("This is an error")
