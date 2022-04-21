//
//  MasterlistViewModel.swift
//  Checklist
//
//  Created by zak on 21/4/2022.
//

import Foundation

class MasterlistViewModel: ObservableObject {
    @Published var masterList: [ChecklistViewModel] = []
    @Published var isLoading: Bool = false
    init() {
        load()
    }
    
    func save() {
        isLoading = true
        var model: [ChecklistModel] = []
        for i in masterList.indices {
            model.append(masterList[i].checkList)
        }
        ChecklistApp.checklistService.save(checklists: model)
        isLoading = false
    }
    
    func load() {
        isLoading = true
        let data = ChecklistApp.checklistService.loadData()
        var checklists: [ChecklistViewModel] = []
        for i in data.indices {
            checklists.append(ChecklistViewModel(checkList: data[i]))
        }
        masterList = checklists
        isLoading = false
    }
}
