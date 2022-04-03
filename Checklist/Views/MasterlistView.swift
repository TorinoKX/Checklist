//
//  MasterlistView.swift
//  Checklist
//
//  Created by zak on 1/4/2022.
//

import SwiftUI

struct MasterlistView: View {
    var masterList: MasterlistViewModel = MasterlistViewModel()
    var body: some View {
        return List(masterList.items, id: \.id){ item in
            NavigationLink(item.name, destination: ChecklistView(checkList: item))
        }
        .navigationTitle("Checklists")
    }
}
