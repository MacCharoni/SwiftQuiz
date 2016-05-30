//
//  ResultsViewController.swift
//  SwiftQuiz
//
//  Created by Mekong Lam on 09.05.16.
//  Copyright © 2016 Mekong Lam. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var numberOfRightAnswers: Int = 0
    var numberOfQuestions: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //ResultStringName = "Du hast \(numberOfRightAnswers) richtig"
        // Do any additional setup after loading the view.
        resultString.text = "Du hast \(numberOfRightAnswers) von \(numberOfQuestions) richtig!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var resultString: UILabel!
    var ResultStringName: String?

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
