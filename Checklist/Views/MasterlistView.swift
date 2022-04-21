//
//  MasterlistView.swift
//  Checklist
//
//  Created by zak on 1/4/2022.
//

import SwiftUI

struct MasterlistView: View {
    @ObservedObject var masterList: MasterlistViewModel
    var body: some View {
        List{
            ForEach( masterList.masterList, id: \.id){ item in
                //row view to allow updating of checklist name when changed in detail view
                ChecklistRowView(checkList: item, onChanged: onChanged)
            }.onDelete { itemNumbers in
                masterList.masterList.remove(atOffsets: itemNumbers)
                masterList.save()
            }
            .onMove(perform: move)
        }
        .navigationTitle("Checklists")
        .navigationBarItems(leading: EditButton(),trailing: Button(action: {
            //append a blank checklist to the masterlist array with default name of "Checklist"
            masterList.masterList.append(ChecklistViewModel(checkList: ChecklistModel()))
            masterList.save()
        }) {
            Image(systemName: "plus")
        })
    }
    
    func onChanged() {
        masterList.save()
    }
    
    func move(from source: IndexSet, to destination: Int) {
        masterList.masterList.move(fromOffsets: source, toOffset: destination)
        masterList.save()
        
    }
}
