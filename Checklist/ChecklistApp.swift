//
//  ChecklistApp.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

@main
struct ChecklistApp: App {
    //Reference to the ChecklistService for use throughout the views
    static var checklistService: ChecklistService = ChecklistService()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
