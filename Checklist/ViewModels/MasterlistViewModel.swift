//
//  MasterlistViewModel.swift
//  Checklist
//
//  Created by zak on 21/4/2022.
//

import Foundation

/**
 A viewmodel for storing an array of ChecklistViewModel's and a variable to check if the JSON data is loading on load or save. Includes functions for saving and loading data, and moving items in the array.
 */
class MasterlistViewModel: ObservableObject {
    @Published var items: [ChecklistViewModel]
    @Published var isLoading: Bool = false
    //When a MasterlistViewModel is initialised it will run the load function to load the data
    init(items: [ChecklistViewModel] = []) {
        self.items = items
        load()
    }
    
    /**
     Sets isLoading to true. Stores the checkList variable for each item in the items array in an array  titled model. Then passes that variable into 'ChecklistApp.checklistService.save'. isLoading then set to false.
     
     - Returns: Nothing
     */
    func save() {
        isLoading = true
        var model: [ChecklistModel] = []
        for i in items.indices {
            model.append(items[i].checkList)
        }
        ChecklistApp.checklistService.save(checklists: model)
        isLoading = false
    }

    /**
     Sets isLoading to true. 'data' constant declared with value returned from 'ChecklistApp.checklistService.loadData'. Stores data into 'checklists' array where each item is a ChecklistViewModel by setting the checkList variable to an entry in 'data'. Sets the 'items' variable in MasterlistViewModel to 'checklists'. isLoading then set to false.
     
     - Returns: Nothing
     */
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
    
     /**
      Moves an item in the checklist. Then calls save function.
      
      - Parameters:
         - from: The index the item was originally located
         - to: The index the item is being moved to
      - Returns: Nothing
      */
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        save()
    }
}
