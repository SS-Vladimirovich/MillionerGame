//
//  StrategyQuestions.swift
//  MillionerGame
//
//  Created by SERGEY SOKOLOV on 23.08.2022.
//

import Foundation

protocol StrategyQuestions {
    func setOrder(in questions: [Question]) -> [Question]
}
