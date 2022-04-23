//
//  ContentView.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

struct ContentView: View {
    //Variable declared in ContentView to allow for toggling of ProgressView
    @ObservedObject var masterList: MasterlistViewModel = MasterlistViewModel()
    var body: some View {
        //if the data is loading, show a "loading icon"
        if masterList.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        //else load up the MasterView
        else{
            NavigationView{
                MasterView(masterList: masterList);
            }
        }
    }
}
