//
//  CheckItemRowView.swift
//  Checklist
//
//  Created by zak on 22/4/2022.
//

import SwiftUI

struct CheckItemRowView: View {
    @StateObject var checkList: ChecklistViewModel
    //for checking if in darkmode
    @Environment(\.colorScheme) var colourScheme
    var onChanged: () -> Void
    var body: some View {
        let withIndex = checkList.items.enumerated().map({ $0 })
        ForEach( withIndex, id: \.element.id){ index, item in
            //each checklist item is a button which will toggle if it is checked or not and reset the undo toggle value
            Button(action: {
                checkList.toggleItem(for: &checkList.items[index])
                checkList.undoToggled=false
                onChanged()
                
            }){
                HStack{
                    Text(item.name)
                    Spacer()
                    //check if checked, show a checkmark image if it is
                    if item.isChecked == true {
                        Image(systemName: "checkmark")
                    }
                }.foregroundColor(colourScheme == .dark ? Color.white : Color.black)
            }
        }.onDelete { itemNumbers in
            checkList.items.remove(atOffsets: itemNumbers)
            onChanged()
        }
        .onMove {
            checkList.move(from: $0, to: $1)
            onChanged()
        }
    }
}
