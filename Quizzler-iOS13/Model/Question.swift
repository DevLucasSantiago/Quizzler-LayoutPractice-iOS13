//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Lucas Santiago on 18/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    //let answer: String
    let answer: [String]
    let correctAnswer: String
    
//    init(q: String, a: String) {
//        self.text = q
//        self.answer = a
//    }
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
