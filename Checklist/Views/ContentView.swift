//
//  ContentView.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

struct ContentView: View {
    let checkList = ChecklistViewModel()
    
    var body: some View {
        NavigationView{
            ChecklistView(checkList: checkList)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
