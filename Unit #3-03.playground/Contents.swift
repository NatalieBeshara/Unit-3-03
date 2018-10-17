
// Created on: 12-Oct-2018
// Created by: Natalie Beshara
// Created for: ICS3U
// This program is a Rock, Paper, Sissors game

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel = UILabel()
    let numberTextField = UITextField()
    let submitButton = UIButton()
    let answerLabel = UILabel()
    let cheatingLabel = UILabel()
    var COMPUTERS_PICK : Int = Int(arc4random_uniform(3)+1)
    // when Swift gets updated to Swift 4.2 use ( let NUMBER_TO_GUESS = Int.random(in: 1 ..< 10 +1) ) to create a random number
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Pick rock, paper or scissors.  Rock=1, Paper=2 and Scissors=3"
        instructionsLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        numberTextField.borderStyle = UITextBorderStyle.roundedRect
        numberTextField.placeholder = "   "
        view.addSubview(numberTextField)
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        numberTextField.bottomAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: 80).isActive = true
        
        submitButton.setTitle("Check", for: UIControlState.normal)
        submitButton.setTitleColor(.blue, for: .normal)
        submitButton.addTarget(self, action: #selector(guessTheNumber), for: .touchUpInside)
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        submitButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 20).isActive = true
        
        answerLabel.text = nil
        answerLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        answerLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20).isActive = true
        
        cheatingLabel.text = String("Answer: \(COMPUTERS_PICK)")
        cheatingLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(cheatingLabel)
        cheatingLabel.translatesAutoresizingMaskIntoConstraints = false
        cheatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        cheatingLabel.bottomAnchor.constraint(equalTo: numberTextField.topAnchor, constant: 27).isActive = true
    }
    @objc func guessTheNumber() {
        //  
        
        var userPicked: Int = Int(numberTextField.text!)!
        let ROCK = 1
        let PAPER = 2
        let SCISSORS = 3
        
        if userPicked == COMPUTERS_PICK {
            answerLabel.text = "It's a tie!"
        }
        
        else if userPicked == 1, COMPUTERS_PICK == 3{
            answerLabel.text = "You won! Computer picked Scissors."
        }
        
        else if userPicked == 2, COMPUTERS_PICK == 1 { 
                answerLabel.text = "You won! Computer picked Rock."
            }
            
        else if userPicked == 3, COMPUTERS_PICK == 2 {
            answerLabel.text = "You won! Computer picked Paper."
        }
        
        else if userPicked == 3, COMPUTERS_PICK == 1{
                answerLabel.text = "You lost. Computer picked Rock. Please try again."
            }
        
        else if userPicked == 1, COMPUTERS_PICK == 2 {
            answerLabel.text = "You lost. Computer picked Paper. Please try again." 
        }
        
        else if userPicked == 2, COMPUTERS_PICK == 3 {
            answerLabel.text = "You lost. Computer picked Scissors. Please try again."
        }
        else {
            answerLabel.text = "Please put pick 1 = Rock, 2 = Paper, 3 = Scissors."
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
