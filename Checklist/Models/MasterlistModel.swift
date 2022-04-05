//
//  MasterlistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

struct MasterlistModel {
    var items: [ChecklistViewModel]
    
    init( items: [ChecklistViewModel] = [ChecklistViewModel()]){
        self.items = items
    }
    
}
