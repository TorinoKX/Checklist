//
//  MasterlistViewModel.swift
//  Checklist
//
//  Created by zak on 3/4/2022.
//

import Foundation

class MasterlistViewModel: ObservableObject {
    //Published so changes are observed
    @Published var items: [ChecklistViewModel]
    
    //Initialises with one blank checklist of name "Checklist"
    init( items: [ChecklistViewModel] = [ChecklistViewModel(checkList: ChecklistModel())]){
        self.items = items
    }
    
    //Appends a checklist to the array
    func addElement(item: ChecklistViewModel) {
        items.append(item)
    }
    
    //Removes a checklist from the array
    func remove(atOffsets indices: IndexSet) {
        items.remove(atOffsets: indices)
    }
}
