//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

class ChecklistViewModel: Identifiable, ObservableObject {
    var id = UUID()
    var items: [CheckItemModel]
    var name: String
    
    init(items: [CheckItemModel] = [], name: String = "Checklist"){
        self.items = items
        self.name = name
    }
}
