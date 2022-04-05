//
//  ContentView.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var masterList: MasterlistViewModel = MasterlistViewModel(Masterlist: MasterlistModel())
    var body: some View {
        NavigationView{
            MasterlistView(masterList: masterList);
        }
    }
}

