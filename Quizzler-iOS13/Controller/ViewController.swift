//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
//    @IBOutlet weak var trueButton: UIButton!
//    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var choiceFourButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @IBAction func hideButton(_ sender: UIButton,_ hide: Bool) {
        let pressedButton : UIButton = sender
        pressedButton.isHidden = hide;
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answers = quizBrain.getQuestionAnswers()

        
        if(answers.count == 4){
            
            choiceOneButton.setTitle(answers[0], for: .normal)
            choiceTwoButton.setTitle(answers[1], for: .normal)
            choiceThreeButton.setTitle(answers[2], for: .normal)
            choiceFourButton.setTitle(answers[3], for: .normal)
            
            hideButton(choiceOneButton, false)
            hideButton(choiceTwoButton, false)
            hideButton(choiceThreeButton, false)
            hideButton(choiceFourButton, false)
            
        }else if(answers.count == 3){
            
            choiceOneButton.setTitle(answers[0], for: .normal)
            choiceTwoButton.setTitle(answers[1], for: .normal)
            choiceThreeButton.setTitle(answers[2], for: .normal)
            
            hideButton(choiceOneButton, false)
            hideButton(choiceTwoButton, false)
            hideButton(choiceThreeButton, false)
            hideButton(choiceFourButton, true)
            
        }else if(answers.count == 2){
            
            choiceOneButton.setTitle(answers[0], for: .normal)
            choiceTwoButton.setTitle(answers[1], for: .normal)
            
            hideButton(choiceOneButton, false)
            hideButton(choiceTwoButton, false)
            hideButton(choiceThreeButton, true)
            hideButton(choiceFourButton, true)
            
        }else{
            choiceOneButton.setTitle(answers[0], for: .normal)
            choiceTwoButton.setTitle(answers[1], for: .normal)
            choiceThreeButton.setTitle(answers[2], for: .normal)
            choiceFourButton.setTitle(answers[3], for: .normal)
            
            hideButton(choiceOneButton, true)
            hideButton(choiceTwoButton, true)
            hideButton(choiceThreeButton, true)
            hideButton(choiceFourButton, true)
        }
        
//        self.trueButton.backgroundColor = UIColor.clear
//        self.falseButton.backgroundColor = UIColor.clear
        
        self.choiceOneButton.backgroundColor = UIColor.clear
        self.choiceTwoButton.backgroundColor = UIColor.clear
        self.choiceThreeButton.backgroundColor = UIColor.clear
        self.choiceFourButton.backgroundColor = UIColor.clear
        
    }
}

