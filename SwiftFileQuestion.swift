//
//  SwiftFileQuestion.swift
//  SwiftQuiz
//
//  Created by Mekong Lam on 02.05.16.
//  Copyright © 2016 Mekong Lam. All rights reserved.
//

import Foundation
import UIKit

struct Question {
    let text: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    let rightAnswer: Int
    let image: UIImage?    
}


// Für die Bildübergabe: Class: UI Image