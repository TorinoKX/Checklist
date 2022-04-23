//
//  ChecklistRowView.swift
//  Checklist
//
//  Created by zak on 7/4/2022.
//

import SwiftUI

struct ChecklistRowView: View {
    //Observed variable for checklist, for display of the name and linking to the detail view
    @ObservedObject var checkList: ChecklistViewModel
    //Declaration for the onChanged function to be passed down the views that need it
    var onChanged: () -> Void
    var body: some View {
        //Nav link showing name of checklist which takes you to detail view for the checklist
        NavigationLink(checkList.name, destination: DetailView(checkList: checkList, onChanged: onChanged))
    }
}
