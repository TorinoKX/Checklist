//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

class ChecklistViewModel: Identifiable, ObservableObject {
    @Published var checkList: ChecklistModel
    var id = UUID()
    var items: [CheckItemViewModel] {
        get { checkList.items }
        set { checkList.items = newValue }
    }
    var name: String {
        get { checkList.name }
        set { checkList.name = newValue }
    }
    
    init(checkList: ChecklistModel = ChecklistModel()){
        self.checkList = checkList
    }
    
    func addElement(item: CheckItemViewModel) {
        checkList.items.append(item)
    }
    
    func remove(atOffsets indices: IndexSet) {
        checkList.items.remove(atOffsets: indices)
    }
}
