//
//  MasterlistView.swift
//  Checklist
//
//  Created by zak on 1/4/2022.
//

import SwiftUI

struct MasterlistView: View {
    @Binding var masterList: [ChecklistViewModel]
    var body: some View {
        List{
            ForEach( masterList, id: \.id){ item in
                //row view to allow updating of checklist name when changed in detail view
                ChecklistRowView(checkList: item)
            }.onDelete { itemNumbers in
                masterList.remove(atOffsets: itemNumbers)
            }
            .onMove(perform: move)
        }
        .navigationTitle("Checklists")
        .navigationBarItems(leading: EditButton(),trailing: Button(action: {
            //append a blank checklist to the masterlist array with default name of "Checklist"
            masterList.append(ChecklistViewModel(checkList: ChecklistModel()))
        }) {
            Image(systemName: "plus")
        })
    }
    
    func move(from source: IndexSet, to destination: Int) {
            masterList.move(fromOffsets: source, toOffset: destination)
        }
}
