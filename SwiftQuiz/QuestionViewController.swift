//
//  QuestionViewController.swift
//  SwiftQuiz
//
//  Created by Mekong Lam on 18.04.16.
//  Copyright © 2016 Mekong Lam. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var Frage1: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var questions: [Question]?
    var question: Question?
    var paleblue: UIColor?
    var counter = 1
    var questionTitle: String?
    var numberOfRightAnswers = 0
    var numberOfQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paleblue = answer1Button.backgroundColor
        print(counter)
        questionTitle = "Frage \(counter)"
        navigationItem.title = questionTitle
        guard let questions = questions else {
            return
        }
        
        let index2 = Int(arc4random()) % questions.count
        question = questions[index2]
        self.questions?.removeAtIndex(index2)
        
            Frage1.text = question?.text
            answer1Button.setTitle(question?.answer1, forState: .Normal)
            answer2Button.setTitle(question?.answer2, forState: .Normal)
            answer3Button.setTitle(question?.answer3, forState: .Normal)
            answer4Button.setTitle(question?.answer4, forState: .Normal)
            imageView.image = question?.image
        print("View did Load: \(Frage1.text)")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did Appear: \(Frage1.text)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answer1ButtonHandler
        (sender: UIButton) {
            checkAnswer(1, button: sender)
            
            //color answer1Button green
          //  toggleColorForButton(answer1Button, color: .greenColor())
            //print("Richtig!")
            
            
            
            
            //Erstelle Pop-up
            //UI AlertController ist ein UIViewController. Bei Fragen mit alt-Taste auf Befehl klicken
            
       
            
    }
    @IBAction func answer2ButtonHandler
        (sender: UIButton) {
          //  toggleColorForButton(answer2Button, color: .redColor())
           // print("Was kannst du eigentlich?")
            checkAnswer(2, button: sender)
    }
    @IBAction func answer3ButtonHandler
        (sender: UIButton) {
            checkAnswer(3, button: sender)
           // toggleColorForButton(answer3Button, color: .redColor())
           // print("Was kannst du eigentlich?")
    }
    @IBAction func answer4ButtonHandler
        (sender: UIButton) {
            checkAnswer(4, button: sender)
          //  toggleColorForButton(answer4Button, color: .redColor())
          //  print("Was kannst du eigentlich?")
    }
    
    private func checkAnswer (index: Int, button: UIButton) {
        if index == question?.rightAnswer {
            numberOfRightAnswers+=1
            print("Anzahl richtiger Antworten \(numberOfRightAnswers)")
            print("Richtig")
            button.backgroundColor = UIColor.greenColor()
            
            let alertController = UIAlertController(title: "Richtig", message: "Super", preferredStyle: .Alert)
            let action = UIAlertAction(title: "😀", style: .Default) { (_) in
            self.showNextQuestion()
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion:  nil)
            
        }
        else {
            print("Was kannst du eigentlich?")
            button.backgroundColor = .redColor()
            
            let alertController = UIAlertController(title: "Was kannst du eigentlich?", message: "Na toll", preferredStyle: .Alert)
            let action = UIAlertAction(title: "💩", style: .Default) { (_) in
                self.showNextQuestion()
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion:  nil)
        }
    }
    
    private func showNextQuestion() {
        
        if questions?.count > 0 {
            performSegueWithIdentifier("ShowNextQuestion", sender: nil)
        }
        else {
            
            performSegueWithIdentifier("Ergebnis", sender: nil)
        }
        
    }
    
    
    /*func toggleColorForButton(button:UIButton, color:UIColor){
        if button.backgroundColor == color {
            button.backgroundColor = paleblue
            
        }
        else if button.backgroundColor == paleblue {
            button.backgroundColor = color
        }
        
        
    }*/
    //"?" Optional

    
    /*---------------------------------*/
    /*
    Bei sender AnyObject mit UIButton ersetzen, dadurch spart man sich das Outlet. "Casten" 
    
    
    @IBAction func answer2ButtonHandler
    (sender: UIButton) {
    sender.backgroundColor=UIColor.greenColor()
    } 
    
    //oder
    
    @IBAction func answer2ButtonHandler
    (sender: UIButton) {
    if let button = sender as! UIButton {
    button.backgroundColor = .greenColor();
    }
    }
    
    */
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Ergebnis" {
            // ... do sth for ergebnis segue
            if let controller = segue.destinationViewController as? ResultsViewController {
                controller.numberOfRightAnswers=numberOfRightAnswers
                if (questions != nil) {
                    controller.numberOfQuestions = numberOfQuestions
                }
            }
            
        } else if segue.identifier == "ShowNextQuestion" {
            // ... do sth and show next question
            if let controller = segue.destinationViewController as? QuestionViewController {
                controller.questions = questions
                controller.counter = counter+1
                controller.numberOfRightAnswers=numberOfRightAnswers
                controller.numberOfQuestions=numberOfQuestions
            }
        }
        
        

    }

/*    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? ResultsViewController {
            
            controller.numberOfRightAnswers=numberOfRightAnswers
            
        }
    }
*/
}
