//
//  Task.swift
//  ToDo List
//
//  Created by Javier Ocón Barreiro on 28/1/23.
//

import Foundation

class Task: Codable {
    var title: String
    var description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    func getTitle() -> String {
        return title
    }

    func getDescription() -> String {
        return description
    }
}
