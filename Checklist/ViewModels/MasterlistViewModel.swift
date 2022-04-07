//
//  MasterlistViewModel.swift
//  Checklist
//
//  Created by zak on 3/4/2022.
//

import Foundation

class MasterlistViewModel: ObservableObject {
    @Published var items: [ChecklistViewModel]
    
    init( items: [ChecklistViewModel] = [ChecklistViewModel(checkList: ChecklistModel(name: "Checklist"))]){
        self.items = items
    }
    
    func addElement(item: ChecklistViewModel) {
        items.append(item)
    }
    
    func remove(atOffsets indices: IndexSet) {
        items.remove(atOffsets: indices)
    }
}
