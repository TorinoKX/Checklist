//
//  AddItemView.swift
//  Checklist
//
//  Created by zak on 22/4/2022.
//

import SwiftUI

/**
 A plus in a circle icon next to a text field for adding items to the checklist.
 */
struct AddItemView: View {
    @State var title = ""
    @StateObject var checkList: ChecklistViewModel
    var onChanged: () -> Void
    var body: some View {
        HStack {
            Image(systemName: "plus.circle").foregroundColor(.green)
            //Text field with the value of title. When committed it will add a new item with that title and reset the name of title before saving the data
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
