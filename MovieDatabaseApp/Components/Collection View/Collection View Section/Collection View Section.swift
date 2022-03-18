//
//  Collection View Section.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-15.
//

import Foundation
import UIKit

// 1
class Section: Hashable {
    var id = UUID()
    // 2
    var title: String
    // 3

    init(title: String) {
        self.title = title
    }

    // 4
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.id == rhs.id
    }
}

extension Section {
    static var allSections: [Section] = [
        Section(title: "Popular Movies"),
        Section(title: "Popular TV Show"),
        // TODO: Make this into Enum
    ]
}
