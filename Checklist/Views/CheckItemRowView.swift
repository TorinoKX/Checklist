//
//  CheckItemRowView.swift
//  Checklist
//
//  Created by zak on 23/4/2022.
//

import SwiftUI

struct CheckItemRowView: View {
    var index: Int
    var item: CheckItemModel
    var checkList: ChecklistViewModel
    var onChanged: () -> Void
    @Environment(\.colorScheme) var colourScheme
    var body: some View {
        Button(action: {
            //Toggles the isChecked value, sets the undoToggled value to false so you can no longer reset the ticks if you tick an item after undoing the ticks. It then saves the data
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
            }.foregroundColor(colourScheme == .dark ? Color.white : Color.black) //To look nicer, needed colourScheme variable so that text would be white in darkmode.
        }
    }
}
