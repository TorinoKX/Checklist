//
//  ChecklistApp.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

@main
struct ChecklistApp: App {
    static var checklistService: ChecklistService = ChecklistService()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
