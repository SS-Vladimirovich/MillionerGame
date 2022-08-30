//
//  ShuffleStrategyQuestions.swift
//  MillionerGame
//
//  Created by SERGEY SOKOLOV on 23.08.2022.
//

import Foundation

class ShuffleStrategyQuestions: StrategyQuestions {
    func setOrder(in questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}
