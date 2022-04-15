//
//  ChecklistRowView.swift
//  Checklist
//
//  Created by zak on 7/4/2022.
//

import SwiftUI

struct ChecklistRowView: View {
    @ObservedObject var checkList: ChecklistViewModel
    @Binding var masterList: [ChecklistViewModel]
    var body: some View {
        //Nav link showing name of checklist which takes you to detail view for the checklist
        NavigationLink(checkList.name, destination: ChecklistView(checkList: checkList, masterList: $masterList))
    }
}
