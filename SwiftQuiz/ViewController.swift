//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Mekong Lam on 18.04.16.
//  Copyright © 2016 Mekong Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    /*    let question1 = Question(text: "Die Dinos lebten...?", answer1: "mit Schulden", answer2: "knietief", answer3: "am Arsch", answer4: "in der Kreide", rightAnswer: 4, category: .DummeFrage, image:UIImage(named: "Questionphotos"))
        questions.append(question1)
        let question2 = Question(text: "Wer wird Millionär?", answer1: "Ein Millionär", answer2: "Deine Mudda", answer3: "Das ist ein Button", answer4: "Ich", rightAnswer: 1, category: .DummeFrage, image:UIImage(named: "Questionphotos2"))
        questions.append(question2)
        
        let question3 = Question(text: "Ich habe hunger", answer1: "Ist mir egal", answer2: "Soll ich dir Geld leihen?", answer3: "Das ist ein Button", answer4: "Ich auch", rightAnswer: 2 , category: .ErnsteFrage, image:UIImage(named: "Questionphotos2"))
        questions.append(question3)
        
        let question4 = Question(text: "Das Wort Casa bedeutet auf spanisch...", answer1: "...Haus", answer2: "...Katze", answer3: "...Dankeschön", answer4: "...Kultur", rightAnswer: 1, category: .ErnsteFrage, image:UIImage(named: "Questionphotos"))
        questions.append(question4)
        */
        var dummeFragenListe = [Question]()
        
        let questiond1 = Question(text: "Das Wort Casa bedeutet auf spanisch...", answer1: "...Haus", answer2: "...Katze", answer3: "...Dankeschön", answer4: "...Kultur", rightAnswer: 1,  image:UIImage(named: "Questionphotos"))
        dummeFragenListe.append(questiond1)
        
        let questiond2 = Question(text: "Deine Mudda bedeutet auf spanisch...", answer1: "...Haus", answer2: "...madre", answer3: "...Dankeschön", answer4: "...Kultur", rightAnswer: 2,  image:UIImage(named: "Questionphotos"))
        dummeFragenListe.append(questiond2)
        
        let dummeFragen = Category(title: "Dumme Fragen", questions: dummeFragenListe)
        categories.append(dummeFragen)
        
        /////////
        
        var ErnsteFragenListe = [Question]()
        
        let questione1 = Question(text: "Das Wort Intelligent bedeutet auf spanisch...", answer1: "...Haus", answer2: "...Katze", answer3: "...intelligénteee", answer4: "...Kultur", rightAnswer: 3, image:UIImage(named: "Questionphotos"))
        ErnsteFragenListe.append(questione1)
        
        let questione2 = Question(text: "Strand bedeutet auf spanisch...", answer1: "...Haus", answer2: "...playa", answer3: "...Dankeschön", answer4: "...Kultur", rightAnswer: 2,  image:UIImage(named: "Questionphotos"))
        ErnsteFragenListe.append(questione2)
        
        let ernsteFragen = Category(title: "Ernste Fragen", questions: ErnsteFragenListe)
        categories.append(ernsteFragen)
        
        /////////
        
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
            let index = Int(arc4random()) % categories.count
            controller.questions = categories[index].questions
            controller.numberOfQuestions = categories[0].questions.count
        }
    }

}

