//
//  MasterlistViewModel.swift
//  Checklist
//
//  Created by zak on 3/4/2022.
//

import Foundation

class MasterlistViewModel: ObservableObject {
    var items: [ChecklistViewModel]
    
    init( items: [ChecklistViewModel] = [ChecklistViewModel()]){
        self.items = items
    }
}
