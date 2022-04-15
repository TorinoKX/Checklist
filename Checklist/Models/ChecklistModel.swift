//
//  ChecklistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

struct ChecklistModel: Codable {
    var items: [CheckItemModel] = []
    var name: String = "Checklist"
}
