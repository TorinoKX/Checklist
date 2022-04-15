//
//  ChecklistApp.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

@main
struct ChecklistApp: App {
    @State var model: [ChecklistModel] = ChecklistApp.model
    static var model: [ChecklistModel] = {
        guard let data  = try? Data(contentsOf: ChecklistApp.fileURL),
              let model = try? JSONDecoder().decode([ChecklistModel].self, from: data) else {
            return []
        }
        return model
    }()
    static var modelBinding: Binding<[ChecklistModel]>?
    
    @State var masterList: [ChecklistViewModel] = {
        var masterList: [ChecklistViewModel] = []
        for i in model.indices {
            masterList.append(ChecklistViewModel(checkList: ChecklistApp.model[i]))
        }
        return masterList
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(masterList: $masterList)
        }
    }
    
    static var fileURL: URL {
        let fileName = "checklists.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        print(documentDir)
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    static func save(masterList: [ChecklistViewModel]) {
        do {
            let data = try JSONEncoder().encode(modelBinding?.wrappedValue ?? {
                var model: [ChecklistModel] = []
                for i in masterList.indices {
                    model.append(masterList[i].checkList)
                }
                return model
            }())
            try data.write(to: fileURL, options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}
