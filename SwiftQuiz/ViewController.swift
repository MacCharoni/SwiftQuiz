//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Mekong Lam on 18.04.16.
//  Copyright © 2016 Mekong Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questions = [Question]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(text: "Die Dinos lebten...?", answer1: "mit Schulden", answer2: "knietief", answer3: "am Arsch", answer4: "in der Kreide", rightAnswer: 4)
        questions.append(question1)
        let question2 = Question(text: "Wer wird Millionär?", answer1: "Ein Millionär", answer2: "Deine Mudda", answer3: "Das ist ein Button", answer4: "Ich", rightAnswer: 1)
        questions.append(question2)
        
        let question3 = Question(text: "Ich habe hunger", answer1: "Ist mir egal", answer2: "Soll ich dir Geld leihen?", answer3: "Das ist ein Button", answer4: "Ich auch", rightAnswer: 2)
        questions.append(question3)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonHandler(sender: AnyObject) {
        print("Button tapped!")
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? QuestionViewController {
           /* let index = Int(arc4random()) % questions.count */
            controller.questions = questions
        }
    }

}

