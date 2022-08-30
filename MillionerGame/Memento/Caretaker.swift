//
//  Caretaker.swift
//  MillionerGame
//
//  Created by SERGEY SOKOLOV on 23.08.2022.
//

import Foundation

final class Caretaker<T: Codable> {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private var key = "\(T.self)"
    
    func saveData(entries: [T]) {
        do {
            let data = try encoder.encode(entries)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadData() -> [T] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([T].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func clearData(type: T.Type) {
        UserDefaults.standard.setValue(nil, forKey: key)
    }
}
