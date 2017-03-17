//: Playground - noun: a place where people can play

import UIKit

// 10 March 2017

/*
1 + 11
"1" + "11"
"Hello " + "World"
29.5 + 9.523
10.5 + 10
print("Welcome to SWIFT World")
*/

//DataTypes
/*
 Integers : 0, 3, 9, -9, -38, 490
 Strings  : "Nikhil", "Vinay", "Ghouse", "890", "%$#%&"
 Floating Point: 39.89, 90.80, 15.00
*/

//Type Inferno 
//Assignment Operator (=)
/*
let billAmount : Double = 60
let tip        : Double
tip = 0.10
let totalBill = billAmount + billAmount * tip
print("Total Amount to pay is \(totalBill) with tip value : \(billAmount * tip)")
*/

//Arthimatic Opertors (+, -, *, /, %)
/*
let Avalue = 10
let Bvalue = 3

print("\nSum of \(Avalue) and \(Bvalue) is \(Avalue + Bvalue)")
print("Sub of \(Avalue) and \(Bvalue) is \(Avalue - Bvalue)")
print("Mul of \(Avalue) and \(Bvalue) is \(Avalue * Bvalue)")
print("Div of \(Avalue) and \(Bvalue) is \(Avalue / Bvalue)")
print("Mod of \(Avalue) and \(Bvalue) is \(Avalue % Bvalue)")
*/

//Comparsion Operators (>=, <=, ==, !=)
/*
let billAmount : Double = 60
var tip : Double
let rating = 14

if rating >= 5 {
    tip = 0.25
}else if rating >= 3 {
    tip = 0.20
}else {
    tip = 0.10
}
let totalBill = billAmount + billAmount * tip
print("Total Amount to pay is \(totalBill) with tip value \(tip) : \(billAmount * tip)")
*/

/*
// For Loop
for i in 1...15 {
    print("Number \(i) ")
}
for i in 1..<15 {
    print("\(i) Numner")
}
 
// ==============================================  11 Mar 2017 ========================================
// Print Table
let tableNumber = 3

for index in 1...10 {
    print("\(tableNumber) x \(index) = \(tableNumber * index)")
}
//Compound arithmatical operator
// +=, -=, *=, /=, %=

//FibonacciSeries
var fib = 0
var temp1 = 1
var temp2 = 0

print(fib)
for index in 0...10 {
    temp2 = fib
    fib += temp1    // fib = fib + temp1   ==>  += is compound arithmatical operator
    temp1 = temp2
    print("\t \(fib) ")
}

// Even Number between 1 to 50
print("Even Numbers")
var evenSum = 0
var oddSum  = 0
for index in 1...100 {
    if index % 2 == 0 {
        print("\(index)")
        evenSum += index
    }else {
        print("\t\(index)")
        oddSum += index
    }
}
print("Even Sum =  \(evenSum) ")
print("Odd  Sum =  \(oddSum) ")

*/

//Functions are short program which are used as sub program and can called 'n' of times
//func <funcation_Name>(<parameters>) -> <return_type> {
    //Function Body
    
//}
// Simple Function without parameters and without return type

/*
func sayHello() {
    print("Hello Friends")
}

sayHello()
sayHello()
sayHello()

//Function with parameters and without return type
func findSum(a : Float, b: Float ) {
    print("Sum = \(a+b)")
}
findSum(a: 2.1, b: 4.8)

//Function with parameters and with return type
func findingSum(x : Float, y: Float) -> Float {
    return (x+y)
}
func findingSub(x : Float, y: Float) -> Float {
    return (x-y)
}
func findingMulti(x : Float, y: Float) -> Float {
    return (x*y)
}
func findingDiv(x : Float, y: Float) -> Float {
    return (x/y)
}
func findingMod(x : Int, y: Int) -> Int {
    return (x%y)
}
print("Value is \(findingDiv(x: 12.2, y: 4.3)) ")
print("Value is \(findingMod(x: 14, y: 4)), \(findingMod(x: 15, y: 4)) ")

print("Value is \(findingSum(x: findingSum(x: 1.1, y: 2.2), y: findingSum(x: 12.1, y: 21.2)))")
*/

// Optionals
/*
var AString : String   // String
var BString : String? //(String Optional)
AString = "Anjali"
BString = "Hema"
print(AString)
//print(BString!) //Force Unwrap, we should be careful, that optionals are not nil, if so (nil) app get crashed

if BString != nil {
    print(BString!) // Safe Unwrap
}

if let BString = BString { // Shaowding
    print(BString)
}
//guard is also used to deal with the optionals
*/

// ==============================================  13 Mar 2017 ========================================
/*
let grade1 = 4
let grade2 = 3
let grade3 = 5

let average = Double(grade1 + grade2 + grade3) / 3.0

// Array
// An Array is an ordered collection that stores multiple values of the same type. that means that an array of Int. it can only store INt values
//syntax <var/let> <array_name>: [<datatype>]
//example var grade:[Int]
var g : Int = 10
var grade:[Int] = [4,3,5]
var exper:[Double] = [1.2, 1.5, 2.1, 3]

var moviesToWatch:[String] = [] // Empty Array
var studentNames: [String] = [
        "🙏🏻",
        "Satyendra",
        "Vinay",
        "Harsha",
        "Poorna",
        "Pramod",
        "❤️"]
studentNames.count

//Index is used to represent the array elements, and index will start from 0 and end with array count - 1
//Loops are used to display array elements easily
studentNames[0]
studentNames[1]
studentNames[2]
studentNames[studentNames.count-1]

//append is used to add elements to array (add at end)
studentNames.append("Ghouse")

//insert is used to add an element in a specified index  insert(at:)

studentNames.insert("Nikil", at: 7)

//remove is used to remove element in a array
studentNames.remove(at: 6)

//Change the contents of the array
studentNames[7] = "Shaik"

//Old Way
for index in 0...studentNames.count-1 {
    print("Hello \(studentNames[index]) is at \(index)")
}

//New Way
for name in studentNames {
    print("Hello \(name)")
}

//copy behavior
//Swift in Array are implemented as structures, that means arrays are copied when they are assigned to a new contant or variable
var numbers = [17, 122, 73, 9, 10, 20]
var otherNumber = numbers
otherNumber.append(4)

//Find Max in the given numbers
var maxVal = numbers[0]

for val in numbers {
    if(maxVal > val ) {
        maxVal = val
    }
}
print("Max Value is \(maxVal)")
*/

// ==============================================  14 Mar 2017 === Tuesday === ==================================

var manyElements:[Int] = [12, 4, 5, 39, 59, 66, 12 , 7, 19, 7]
//Find sum of all odd number and even number in the given array and try to find max of even number, max of odd number
var sumOdd  = 0
var sumEven = 0
var maxEven = manyElements[0]
var maxOdd  = manyElements[0]

for value in manyElements {
    if value % 2 == 0 {         // % - Mod - Remainder
        sumEven += value        // sumEven = sumEven + value
        if(value<maxEven) {
            maxEven = value
        }
    }else {
        sumOdd  += value
        if(value<maxOdd) {
            maxOdd = value
        }
    }
}

print("Sum of all Even numbers : \(sumEven)")
print("Sum of all Odd  numbers : \(sumOdd)")

print("Max Even number : \(maxEven)")
print("Max Odd  number : \(maxOdd)")

//Sort the given array in a order. (Students Task)

// RECURSION
// A Funciton that calls itself is called a recursive function. Resursive solutions usually have less code and are more elegant
// that iterative equivalents.
// Example
/*
func printNumbers(3 : Int) {
    if(3 > 1) {
        printNumbers(N : 3-1)
    }
    print(3)
}
func printNumbers(2 : Int) {
    if(2 > 1) {
        printNumbers(N : 2-1)
    }
    print(2)
}
func printNumbers(1 : Int) {
    if(1 > 1) {
        printNumbers(N : 1-1)
    }
    print(1)
}*/
// Printing First N numbers
func printNumbers(N : Int) {
    if(N > 1) {
        printNumbers(N: N-1)
    }
    print(N)
}
printNumbers(N: 10)

// Finding Factorial
// 5! = 5 * 4 * 3 * 2 * 1 = 120

func factorial (N : Int) -> Int {
    if(N == 1) {
        return 1
    } else {
        return N * factorial(N: N-1)
    }
}
var f = 7
print("Fact of \(f) is \(factorial(N: f)) ")

// Find Power function power(2,3) = 8
/*
func power(2 : Int, 3 : Int) -> Int {
    if 3 == 0 {
        return 1
    }else {
        return 2 * power(base: 2, exp: 2)
    }
}
func power(2 : Int, 2 : Int) -> Int {
    if 2 == 0 {
        return 1
    }else {
        return 2 * power(base: 2, exp: 1)
    }
}
func power(2 : Int, 1 : Int) -> Int {
    if 1 == 0 {
        return 1
    }else {
        return 2 * power(base: 2, exp: 0)
    }
}
func power(2 : Int, 0 : Int) -> Int {
    if 0 == 0 {
        return 1
    }else {
        return 2 * power(base: 2, exp: 0)
    }
}*/

func power(base : Int, exp : Int) -> Int {
    if exp == 0 {
        return 1
    }else {
        return base * power(base: base, exp: exp - 1)
    }
}
var base = 2
var exp  = 3

print("power(\(base),\(exp)) is \(power(base: base, exp: exp))")

// ==============================================  15 Mar 2017 === Wednesday === ==================================
// Closures are self contained chunks of code that can eb passed around and used in your code. 
// Closures can capture and store references to any constants or variables 
// Declaring a closure
// {(parameters) -> return type in
//   statements // condition
// }
// Simple closure that has no parameters and return a string

var sayHello : () -> String = {
    return "Hello Friends, Good Evening!"
}
sayHello()

// a closure with one parameter of Int and return an Int
var salary : (Int) -> Int = { month in
    if(month == 4 || month == 5) {
        return 0
    }
    return 23500
}
salary(5)

var newSalary = salary
newSalary(3)

var numbers = [1, 18, 11, 4, 2, 9, 0]
numbers.sort() // sort is a closure for an array type
numbers.sort()

// Tuples is a group of zero or more values represented as one value
// For example ("Ghouse", "Basha") holds the first and last name of a person. to access inner values use dot (.) notation followed by the index

var faculty = ("Ghouse", "Basha" ,"Shaik")
var firstName = faculty.0
var lastName  = faculty.2

//Named elements
var student = (firstname : "Vinay", lastname : "Vedhulla")
student.firstname

var ghouse = (name : "Ghouse", age : 35, isMarried : true)
var harsha = (name : "Harsha", age : 22, isMarried : false)
ghouse.isMarried
harsha.age

//Creating a funcation to find both quotient and remainder

func divMod(a : Int, b : Int) -> (quotient: Int, remainder: Int) {
    return (a / b, a % b)
}

divMod(a: 10, b: 3)
divMod(a: 5, b: 2)
divMod(a: 25, b: 5)

// ============================  16 Mar 2017 === Thu === ==================================


//An enumeration is a user-defined data type which consits of set of related values. 
//keyword enum is used to define enumerated data types
//Syntax:
// enum <enum_name> {

//}

enum SwiftTopics {
    case OOPS
    case Closures
    case enums
    case functions
    case Protocols
}

var age   : Int = 29
var topic : SwiftTopics = .functions

let roll = 29
let newtopic = SwiftTopics.enums


enum Climate {
    case India
    case America
    case Africa
    case Australia
    case Kuwait
}
var season = Climate.India

switch season {
    case .India:
    print("Hot")
    
    case .Africa:
    print("Cold")
    
    case .Australia:
    print("Moderate")
    //fallthrough
    case .America:
    print("Snow Strom")
    //fallthrough
    default:
    print("Not Predictable")
}
//break keyword is used to exit the switch...case
//the code will execute the case which matches with the switch pattern
//default will get executed when non of the cases are matched, 
//each case should have break statement
//fallthrough is used to continue the next case match



//Enum with Associated Values
enum Student {
    case Name(String)
    case Mark(Int,Int,Int)
    case FeePaid(String, Double)
}
var studDetails = Student.Name("Satyendra")
var studMarks   = Student.Mark(98, 97, 95)
var studeFee    = Student.FeePaid("Dec", 2500)

switch studeFee {
    case .Name(let name):
        print("Student Name : \(name)")
    
    case .Mark(let mt1, let mt2, let mt3):
        print("Student Marks are : \(mt1), \(mt2) and \(mt3)")
    
    case .FeePaid(let month, let feeAmt):
        print("Student Paided : \(feeAmt),for the month of \(month)")
    
    default:
        print("Nothing to say")
}

//Enum with raw Values
enum Month : Int {
    case Jan = 1, Feb , Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
}
let thisMonth = Month.Mar.rawValue

//          Associated Values                                                 Raw Values
//================================================================================================
//      1. Different DataTypes                                                  1. Same DataTypes
//      2. ex. enum("Apr", 2300.84)                                        2. enum (10,20,30)
//      3. varies when declared each time                                  3. value for members is same

// =================  17 Mar 2017 === FRI === ==================================
// Structure and Class are basic buildiing blocks
// syntax :
// class <class_name> {
//    //properties
//    //methods
//}
class Person {
    var name : String = "" //Property
    var age : Int = -1        //Property
    func run()  {              // Method are nothing but, functions inside class/struct
        print("Person can run")
    }
}
struct House {
    var streetNumber : String = "000"
    var area : Int = -1
    func upgrade() {
        print("Searching for new address")
    }
}

var p = Person()
// dot (.) operator is used to bind object and property/methods
p.name = "Ghouse"
p.age = 35
p.run()

var h = House()
h.streetNumber = "111"
h.area = 3
h.upgrade()

var h3 = h // h3 is copy by value, h3 is variable value
h3.streetNumber = "333"
h3.area = 5
h

var p3 = p //p3 is reference type
p3.name = "Basha"
p3.age = 36
p

let h5 = h3 // h5 is a constant value
//h5 = h Error
//h5.streetNumber = "222"

let p5 = p // p5 is a constant reference
//p5 = p //Error
p5.name = "Raj"
p
// Struct is a Value Type                           Class is a Referrence Type

// Struct let constant values does not allow to reassign and
// Struct will not allow to change properties even it is var, since parent is constant

// Class let reference values does not alllow to reassing but can chnage properties

var A = 10
var B = 3
print("A = \(A), B = \(B)")

    func MySwap( A : Int,  B : Int) {
        var A = A
        var B = B
        A = A+B
        B = A-B
        A = A-B
        print("in Function: A = \(A), B = \(B)")
    }

MySwap(A: A, B: B)
print("A = \(A), B = \(B)")

    func MyNewSwap( A : inout Int,  B : inout Int) {
        A = A+B
        B = A-B
        A = A-B
        print("in Function: A = \(A), B = \(B)")
    }
    MyNewSwap(A: &A,  B: &B)
print("A = \(A), B = \(B)")











