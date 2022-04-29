//
//  ContentView.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

/**
 Declares masterList variable for use with the progressView. Will show the progressView if the data in masterList is still loading, otherwise will load MasterView in a NavigationView with masterList passed into masterList.
 */
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
                DetailView(checkList: masterList.items[0], onChanged: masterList.save)
            }
        }
    }
}
