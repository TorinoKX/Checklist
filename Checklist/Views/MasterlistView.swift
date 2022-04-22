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
                onChanged()
            }
            .onMove(perform: move)
        }
        .navigationTitle("Checklists")
        .navigationBarItems(leading: EditButton(),trailing: AddButtonView(masterList: masterList, onChanged: onChanged))
    }
    
    func onChanged() {
        masterList.save()
    }
    
    func move(from source: IndexSet, to destination: Int) {
        masterList.masterList.move(fromOffsets: source, toOffset: destination)
        onChanged()
    }
}
