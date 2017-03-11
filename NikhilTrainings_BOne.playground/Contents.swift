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
var AString : String   // String
var BString : String? //(String Optional)
AString = "Anjali"
BString = "Hema"
print(AString)
//print(BString!) // Force Unwrap

if BString != nil {
    print(BString!) // Safe Unwrap
}

if let BString = BString {
    print(BString)
}


