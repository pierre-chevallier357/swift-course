//
//  ViewController.swift
//  Calculatrice
//

import UIKit

enum Operation: String {
    case addition = "+"
    case soustraction = "-"
    case multiplication = "*"
    case division = "/"
}

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    var firstNumber: Int?
    var secondNumber: Int?
    var operation: Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLabels()
    }
    
    private func initLabels() {
        resultLabel.text = nil
        errorLabel.text = nil
    }
    
    private func reinitCalculatrice() {
        firstNumber = nil;
        secondNumber = nil;
        operation = nil;
        //TODO: réinitialiser les valeurs
    }
    
    private func addNumber(_ numberToAdd: Int) {
        errorLabel.text = nil
        
        if operation == nil {
            if (firstNumber == nil){
                firstNumber = numberToAdd;
            }else{
                firstNumber! = firstNumber! * 10;
                firstNumber! += numberToAdd;
            }
            
            // TODO
        } else if numberToAdd == 0 {
            if(secondNumber == nil && operation == .division){
                errorLabel.text = "Division par 0";
            }else{
                if (secondNumber == nil){
                    secondNumber = numberToAdd;
                }else{
                    secondNumber! = secondNumber! * 10;
                    secondNumber! += numberToAdd;
                }
            }
            
            // TODO
        } else {
            if (secondNumber == nil){
                secondNumber = numberToAdd;
            }else{
                secondNumber! = secondNumber! * 10;
                secondNumber! += numberToAdd;
            }
            // TODO
        }
        
        displayOperation()
    }
    
    private func displayOperation() {
        var valueToDisplay: String = ""
        
        if firstNumber != nil {
            valueToDisplay = "\(String(describing: firstNumber)) ";
			// TODO
        }
        if operation != nil {
            valueToDisplay = "\(String(describing: operation)) ";
        }
        if secondNumber != nil {
            valueToDisplay = "\(String(describing: secondNumber)) ";
			// TODO
        }
		
        resultLabel.text = valueToDisplay
    }
    
    private func calculateResult() {
        errorLabel.text = nil
        
        if operation != nil && secondNumber == nil {
            errorLabel.text = "Tu dois saisir un deuxième nombre"
            
        } else {
            switch operation{
            case .addition:
                resultLabel.text = "\(String(describing: firstNumber! + secondNumber!))"
            case .soustraction:
                resultLabel.text = "\(String(describing: firstNumber! - secondNumber!))"
            case .multiplication:
                resultLabel.text = "\(String(describing: firstNumber! * secondNumber!))"
            case .division:
                resultLabel.text = "\(String(describing: firstNumber! / secondNumber!))"
            case .none:
                resultLabel = nil
            }
            reinitCalculatrice()
        }
    }

    @IBAction func zeroAction(_ sender: Any) {
        addNumber(0)
    }
    
    @IBAction func oneAction(_ sender: Any) {
        addNumber(1)
    }
    
    @IBAction func twoAction(_ sender: Any) {
        addNumber(2)
    }
    
    @IBAction func threeAction(_ sender: Any) {
        addNumber(3)
    }
    
    @IBAction func fourAction(_ sender: Any) {
        addNumber(4)
    }
    
    @IBAction func fiveAction(_ sender: Any) {
        addNumber(5)
    }
    
    @IBAction func sixAction(_ sender: Any) {
        addNumber(6)
    }
    
    @IBAction func sevenAction(_ sender: Any) {
        addNumber(7)
    }
    
    @IBAction func heightAction(_ sender: Any) {
        addNumber(8)
    }
    
    @IBAction func nineAction(_ sender: Any) {
        addNumber(9)
    }
    
    @IBAction func addAction(_ sender: Any) {
        operation = .addition
    }
    
    @IBAction func subAction(_ sender: Any) {
        operation = .soustraction
    }
    
    @IBAction func mulAction(_ sender: Any) {
        operation = .multiplication
    }
    
    @IBAction func divAction(_ sender: Any) {
        operation = .division
    }
    //TODO: Les operateurs
    
    @IBAction func resultAction(_ sender: Any) {
        calculateResult()
        
    }

}

