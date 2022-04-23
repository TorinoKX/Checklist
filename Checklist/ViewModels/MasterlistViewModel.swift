//
//  MasterlistViewModel.swift
//  Checklist
//
//  Created by zak on 21/4/2022.
//

import Foundation

class MasterlistViewModel: ObservableObject {
    @Published var items: [ChecklistViewModel] = []
    @Published var isLoading: Bool = false
    //When a MasterlistViewModel is initialised it will run the load function to load the data
    init() {
        load()
    }
    
    //Converts the array of ChecklistViewModel into an array of ChecklistModel before passing into the save function in the checklistService
    func save() {
        isLoading = true
        var model: [ChecklistModel] = []
        for i in items.indices {
            model.append(items[i].checkList)
        }
        ChecklistApp.checklistService.save(checklists: model)
        isLoading = false
    }

    //loads the JSON data, converts from ChecklistModel to ChecklistViewModel then sets the items variable to the converted data
    func load() {
        isLoading = true
        let data = ChecklistApp.checklistService.loadData()
        var checklists: [ChecklistViewModel] = []
        for i in data.indices {
            checklists.append(ChecklistViewModel(checkList: data[i]))
        }
        items = checklists
        isLoading = false
    }
    
    //for moving in a list, then saves
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        save()
    }
}
