//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

class CheckItemModel: Identifiable, ObservableObject {
    @Published var itemName: String
    @Published var isChecked: Bool
    
    init(itemName: String = "", isChecked: Bool = false){
        self.itemName = itemName
        self.isChecked = isChecked
    }
}
