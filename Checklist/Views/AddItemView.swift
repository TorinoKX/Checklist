//
//  AddItemView.swift
//  Checklist
//
//  Created by zak on 22/4/2022.
//

import SwiftUI

struct AddItemView: View {
    @State var title = ""
    @StateObject var checkList: ChecklistViewModel
    var onChanged: () -> Void
    var body: some View {
        HStack {
            Image(systemName: "plus.circle").foregroundColor(.green)
            TextField("Enter new entry name", text: $title) {
                var newItem = CheckItemModel()
                newItem.name = title
                checkList.addElement(item: newItem)
                title = ""
                onChanged()
            }
        }
    }
}
