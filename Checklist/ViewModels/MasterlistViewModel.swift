//
//  MasterlistViewModel.swift
//  Checklist
//
//  Created by zak on 3/4/2022.
//

import Foundation

class MasterlistViewModel: ObservableObject {
    
    @Published var Masterlist: MasterlistModel
    var items: [ChecklistViewModel] {
        get { Masterlist.items }
        set { Masterlist.items = newValue }
    }
    
    init( Masterlist: MasterlistModel ){
        self.Masterlist = Masterlist
    }
    
    func addElement(item: ChecklistViewModel) {
        Masterlist.items.append(item)
    }
    
    func remove(atOffsets indices: IndexSet) {
        Masterlist.items.remove(atOffsets: indices)
    }
}
