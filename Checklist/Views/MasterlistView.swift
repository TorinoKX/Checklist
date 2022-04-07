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
            ForEach( masterList.items, id: \.id){ item in
                ChecklistRowView(checkList: item)
            }.onDelete { itemNumbers in
                masterList.remove(atOffsets: itemNumbers)
            }
        }
        .navigationTitle("Checklists")
        .navigationBarItems(leading: EditButton(),trailing: Button(action: {
            masterList.addElement(item: ChecklistViewModel(checkList: ChecklistModel(name: "Checklist")))
        }) {
            Image(systemName: "plus")
        })
    }
}
