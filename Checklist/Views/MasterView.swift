//
//  MasterView.swift
//  Checklist
//
//  Created by zak on 1/4/2022.
//

import SwiftUI

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
    
    //Created as a function to be passed down to other views, alternative was to pass the masterList all the way down
    func onChanged() {
        masterList.save()
    }
}
