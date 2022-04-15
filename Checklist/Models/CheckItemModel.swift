//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

struct CheckItemModel: Identifiable, Codable {
    var name: String = ""
    var isChecked: Bool = false
    var oldChecked: Bool = false
    var id = UUID()
}
