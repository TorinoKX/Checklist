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
                NavigationLink(item.name, destination: ChecklistView(checkList: item))
            }.onDelete { offsets in
                masterList.items.remove(atOffsets: offsets)
            }
        }
        .navigationBarItems(leading: Button(action: {
            masterList.items.append(ChecklistViewModel())
                    }) {
                        Image(systemName: "plus")
                    })
        .navigationTitle("Checklists")
        .toolbar {
            EditButton()
        }
    }
}
