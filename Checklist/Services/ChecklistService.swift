//
//  ChecklistService.swift
//  Checklist
//
//  Created by zak on 21/4/2022.
//

import Foundation

class ChecklistService {
    //funciton to load the data from the JSON file as an array of ChecklistModel's
    func loadData() -> [ChecklistModel] {
        guard let data  = try? Data(contentsOf: fileURL),
              let model = try? JSONDecoder().decode([ChecklistModel].self, from: data) else {
            return []
        }
        return model
    }
        
    //Supplies the fileURL for the JSON data
    var fileURL: URL {
        let fileName = "checklists.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        print(documentDir)
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    //saves an array of ChecklistModel's to the JSON file
    func save(checklists: [ChecklistModel]) {
        do {
            let data = try JSONEncoder().encode(checklists)
            try data.write(to: fileURL, options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}
