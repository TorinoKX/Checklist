//
//  ContentView.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var masterList: MasterlistViewModel = MasterlistViewModel()
    var body: some View {
        if masterList.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        else{
            NavigationView{
                MasterlistView(masterList: masterList);
            }
        }
    }
}
