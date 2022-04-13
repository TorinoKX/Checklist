//
//  MasterlistView.swift
//  Checklist
//
//  Created by zak on 1/4/2022.
//

import SwiftUI

struct MasterlistView: View {
    @ObservedObject var masterList: MasterlistViewModel = MasterlistViewModel()
    var body: some View {
        List{
            ForEach( masterList.items, id: \.id){ item in
                //row view to allow updating of checklist name when changed in detail view
                ChecklistRowView(checkList: item)
            }.onDelete { itemNumbers in
                masterList.remove(atOffsets: itemNumbers)
            }
            .onMove(perform: masterList.move)
        }
        .navigationTitle("Checklists")
        .navigationBarItems(leading: EditButton(),trailing: Button(action: {
            //append a blank checklist to the masterlist array with default name of "Checklist"
            masterList.addElement(item: ChecklistViewModel(checkList: ChecklistModel()))
        }) {
            Image(systemName: "plus")
        })
    }
}
