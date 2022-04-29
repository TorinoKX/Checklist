//
//  MasterView.swift
//  Checklist
//
//  Created by zak on 1/4/2022.
//

import SwiftUI

/**
 Displays a list, calling the ChecklistRowView with each item in the masterList passed in, as well as the onChanged function declared in this view. Also handles deletion, moving, and adding items. Has default navigation title of "Checklists". The add button is done via AddButtonView.
 */
struct MasterView: View {
    //Observed object of masterList passed in from ContentView
    @ObservedObject var masterList: MasterlistViewModel
    var body: some View {
        //Lists the checklists by name with functionalities
        List{
            ForEach( masterList.items, id: \.id){ item in
                ChecklistRowView(checkList: item, onChanged: onChanged)
            }.onDelete { itemNumbers in
                masterList.items.remove(atOffsets: itemNumbers)
                onChanged()
            }
            .onMove(perform: masterList.move)
        }
        .navigationTitle("Checklists")
        //Edit button and an add button for adding checklists to the array
        .navigationBarItems(leading: EditButton(),trailing: AddButtonView(masterList: masterList, onChanged: onChanged))
    }
    
    /**
     Calls the save function for the masterList variable of MasterView. Exists to be passed down to other views for saving the masterList.
     */
    func onChanged() {
        masterList.save()
    }
}
