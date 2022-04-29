//
//  CheckItemListView.swift
//  Checklist
//
//  Created by zak on 22/4/2022.
//

import SwiftUI

/**
 Lists each item via CheckItemRowView with index, item, checkList, and onChanged passed in. Also allows removal and moving of items.
 */
struct CheckItemListView: View {
    @StateObject var checkList: ChecklistViewModel
    //for checking if in darkmode
    var onChanged: () -> Void
    var body: some View {
        let withIndex = checkList.items.enumerated().map({ $0 })
        ForEach( withIndex, id: \.element.id){ i, item in
            //each checklist item is a button which will toggle if it is checked or not and reset the undo toggle value
            CheckItemRowView(index: i, item: item, checkList: checkList, onChanged: onChanged)
        }.onDelete { itemNumbers in
            //removes the item then saves
            checkList.items.remove(atOffsets: itemNumbers)
            onChanged()
        }
        .onMove {
            //moves the item then saves
            checkList.move(from: $0, to: $1)
            onChanged()
        }
    }
}
