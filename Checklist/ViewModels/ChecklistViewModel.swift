//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

class ChecklistViewModel: Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    @Published var checkList: ChecklistModel
    var items: [CheckItemModel] {
        get { checkList.items }
        set { checkList.items = newValue }
    }
    
    init(name: String = "Checklist", checkList: ChecklistModel = ChecklistModel()){
        self.name = name
        self.checkList = checkList
    }
    
    func addElement(item: CheckItemModel) {
        checkList.items.append(item)
    }
    
    func remove(atOffsets indices: IndexSet) {
        checkList.items.remove(atOffsets: indices)
    }
}
