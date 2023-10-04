//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0

    /// Perform Addition
      ///
      /// - Author: Jacktator
      /// - Parameters:
      ///   - no1: First number
      ///   - no2: Second number
      /// - Returns: The addition result
      ///
      /// - Warning: The result may yield Int overflow.
      /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
      func add(no1: Int, no2: Int) -> Int {
          return no1 + no2;
      }
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2
    }
    
    func divide(no1: Int, no2: Int) throws -> Int {
        guard no2 != 0 else {
            print("You can't divide by zero!.")
            exit(1)
        
        }
        
        let result = no1 / no2
        
        guard result <= Int.max && result >= Int.min else {
           
            print("Numeric OverFlow.")
            exit(1)
        }
        
        return result
    }
    
    func modulo(no1: Int, no2: Int) throws -> Int {
        guard no2 != 0 else {
            print("You can't divide by zero!.")
            exit(1)
            
        }
        
        let result = no1 % no2
        
        guard result <= Int.max && result >= Int.min else {
          
            print("Numeric OverFlow.")
            exit(1)
        }
        
        return result
    }
}

enum CalculatorError: Error {
    case divideByZero
    case numericOverflow
}
