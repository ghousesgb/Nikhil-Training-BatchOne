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
        printNumbers(N-1)
    }
    print(N)
}
printNumbers(10)

// Finding Factorial
// 5! = 5 * 4 * 3 * 2 * 1 = 120

func factorial (N : Int) -> Int {
    if(N == 1) {
        return 1
    } else {
        return N * factorial(N-1)
    }
}
var f = 7
print("Fact of \(f) is \(factorial(f)) ")

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
        return base * power(base, exp: exp - 1)
    }
}
var base = 2
var exp  = 3

print("power(\(base),\(exp)) is \(power(base, exp: exp))")

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

divMod(10, b: 3)
divMod(5, b: 2)
divMod(25, b: 5)

//enum





