//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Chingiz on 17.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWork: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var working: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    func clearAll(){
        working = ""
        calculatorWork.text = ""
        calculatorResult.text = ""
    }
    
    func addToWorking(_ value: String) {
        working += value
        calculatorWork.text = working
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: UIButton) {
        if(!working.isEmpty){
            working.removeLast()
            calculatorWork.text = working
        }
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorking("%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorking("/")
    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToWorking("*")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorking("-")
    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorking("+")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorking("7")
    }
    
    @IBAction func eigthTap(_ sender: Any) {
        addToWorking("8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorking("9")
    }
    
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorking("4")
    }
    
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorking("5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorking("6")
    }
    
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorking("1")
    }
    
    
    @IBAction func twoTao(_ sender: Any) {
        addToWorking("2")
    }
    
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorking("3")
    }
    
    @IBAction func dotTap(_ sender: Any) {
        addToWorking(".")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorking("0")
    }
    
    @IBAction func resultTap(_ sender: Any) {
        if validInput() {
            let checkedWorkingsForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: working)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResult.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Unable to do math", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            
            present(alert, animated: true)
        }
        
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
        
    }
    
    
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexed = [Int]()
        
        for char in working {
            if(specialCharacter(char: char)){
                funcCharIndexed.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexed{
            if(index == 0 ){
                return false
            }
            
            if(index == working.count - 1 ){
                return false
            }
            
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        if char == "*"{
            return true
        }
        if char == "+"{
            return true
        }
        if char == "/"{
            return true
        }
        return false
    }
    
}

