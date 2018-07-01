//: [Previous](@previous)

import Foundation

func maxCupcakes(budgetN:Int, cupcakeC:Int, wrappersM: Int) -> (max:Int, resto:Int) {
    let numOfCupcakes = budgetN / cupcakeC
    let freeCupcakes = numOfCupcakes / wrappersM
    let resto = abs(wrappersM - numOfCupcakes)
    print("budget: \(budgetN), costs: \(cupcakeC), numOfCupcakes: \(numOfCupcakes), wrapp: \(wrappersM) free: \(freeCupcakes), resto: \(resto)")
    return ((freeCupcakes + numOfCupcakes), resto)
}

let trips = ["11 21 5", "12 14 4","3 14 15"]
var somaResto = 0
for values in trips {
    let arrayValues = values.split(separator: " ")
    
    let n = (arrayValues[0] as NSString).integerValue
    let c = (arrayValues[1] as NSString).integerValue
    let m = (arrayValues[2] as NSString).integerValue
    
    let maxResult = maxCupcakes(
        budgetN: n,
        cupcakeC: c,
        wrappersM: m)
    somaResto += maxResult.resto
    print("\(maxResult.max + (somaResto / m))")
}
