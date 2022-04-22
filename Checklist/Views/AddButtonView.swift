//
//  AddButtonView.swift
//  Checklist
//
//  Created by zak on 22/4/2022.
//

import SwiftUI

struct AddButtonView: View {
    var masterList: MasterlistViewModel
    var onChanged: () -> Void
    var body: some View {
        Button(action: {
            //append a blank checklist to the masterlist array with default name of "Checklist"
            masterList.masterList.append(ChecklistViewModel(checkList: ChecklistModel()))
            onChanged()
        }) {
            Image(systemName: "plus")
        }
    }
}
