//
//  Question.swift
//  MillionerGame
//
//  Created by SERGEY SOKOLOV on 23.08.2022.
//

import Foundation

struct Question: Codable {
    let text: String
    let custom: Bool
    let answers: [Answer]
}

struct Answer: Codable {
    let answer: String
    let correct: Bool
}
