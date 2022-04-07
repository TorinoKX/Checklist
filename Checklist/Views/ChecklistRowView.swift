//
//  ChecklistRowView.swift
//  Checklist
//
//  Created by zak on 7/4/2022.
//

import SwiftUI

struct ChecklistRowView: View {
    @ObservedObject var checkList: ChecklistViewModel
    var body: some View {
        NavigationLink(checkList.name, destination: ChecklistView(checkList: checkList))
    }
}
