//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

struct ChecklistViewModel {
    var items: [CheckItemModel] = []
    
    init(){
        items.append(CheckItemModel(itemName: "Apples", isChecked: true))
        items.append(CheckItemModel(itemName: "Beans", isChecked: false))
        items.append(CheckItemModel(itemName: "Lemons", isChecked: false))
        items.append(CheckItemModel(itemName: "Avocados", isChecked: true))
        items.append(CheckItemModel(itemName: "Peaches", isChecked: true))
    }
}
