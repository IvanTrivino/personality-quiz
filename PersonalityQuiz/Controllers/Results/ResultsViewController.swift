//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Ivan Camilo Triviño López on 12/17/18.
//  Copyright © 2018 Ivan Camilo Triviño López. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // Connections
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    // Variables
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        calculatePersonalityResult()
    }
    
    // Actions
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue){
        
    }
    
    // Methods
    func calculatePersonalityResult(){
        var freqOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map{ $0.type }
        
        for response in responseTypes{
            freqOfAnswers[response] = (freqOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = freqOfAnswers.sorted(by: {
                (pair1, pair2) -> Bool in
                    return pair1.value > pair2.value
            }
        )
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}
