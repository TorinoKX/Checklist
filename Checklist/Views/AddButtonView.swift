//
//  AddButtonView.swift
//  Checklist
//
//  Created by zak on 22/4/2022.
//

import SwiftUI

/**
 A simple button with a plus symbol. Appends ChecklistViewModel with the checkList being a ChecklistModel with default initialisation to the masterList. Also calls the onChanged function from masterList.
 */
struct AddButtonView: View {
    var masterList: MasterlistViewModel
    var onChanged: () -> Void
    var body: some View {
        Button(action: {
            //append a blank checklist to the masterlist array with default name of "Checklist"
            masterList.items.append(ChecklistViewModel(checkList: ChecklistModel()))
            onChanged()
        }) {
            Image(systemName: "plus")
        }
    }
}
