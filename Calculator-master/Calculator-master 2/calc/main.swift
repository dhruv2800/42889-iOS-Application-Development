import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Initialize a Calculator object
let calculator = Calculator()

// Calculate and return the result

    let result = calculateExpression(args)
    print(result)


func calculateExpression(_ args: [String]) -> Int {
    var values = [Int]()
    var operators = [String]()
    var containsOperator = false
    for element in args {
        switch element {
        case "+", "-", "x", "/", "%":
            operators.append(element)
            containsOperator = true
        default:
            guard let value = Int(element) else {
                print("Invalid input!.")
                exit(1)
            }
            values.append(value)
        }
    }
    
    if !containsOperator && values.count >= 2
    {
        print("Missing Operators!.")
        exit(1)
    }

    guard values.count > 0 else {
        print("Invalid input!.")
        exit(1)
    }

    do {
        while operators.contains("x") || operators.contains("/") || operators.contains("%") {
            if let operatorIndex = operators.firstIndex(where: { $0 == "x" || $0 == "/" || $0 == "%" }) {
                let operand1 = values[operatorIndex]
                let operand2 = values[operatorIndex + 1]

                let operatorSymbol = operators[operatorIndex]

                let result: Int

                switch operatorSymbol {
                case "x":
                    result = calculator.multiply(no1: operand1, no2: operand2)
                case "/":
                    if operand2 == 0 {
                        print("Divide by Zero Error.")
                        exit(1)
                    }
                    result = try calculator.divide(no1: operand1, no2: operand2)
                case "%":
                    if operand2 == 0 {
                        print("Divide by zero error!.")
                        exit(1)
                    }
                    result = try calculator.modulo(no1: operand1, no2: operand2)
                default:
                    print("Invalid Operator!.")
                    exit(1)
                }

                values.replaceSubrange(operatorIndex...operatorIndex+1, with: [result])
                operators.remove(at: operatorIndex)
            }
        }

        while operators.count > 0 {
            let operand1 = values[0]
            let operand2 = values[1]

            let operatorSymbol = operators[0]

            let result: Int

            switch operatorSymbol {
            case "+":
                result = calculator.add(no1: operand1, no2: operand2)
            case "-":
                result = calculator.subtract(no1: operand1, no2: operand2)
            default:
                print("Invalid Operator!.")
                exit(1)
            }

            values.replaceSubrange(0...1, with: [result])
            operators.remove(at: 0)
        }

        return values[0]

    } catch CalculatorError.divideByZero {
        print("Cannot divide by zero.")
        exit(1)
    } catch {
        print("An unknown error occurred.")
        exit(1)
    }
}

