//
//  ChecklistService.swift
//  Checklist
//
//  Created by zak on 21/4/2022.
//

import Foundation

/**
 A service file for handling loading and saving data to a JSON file.
 */
class ChecklistService {
    /**
     Loads the data from the fileURL before returning the data. If unable to load, returns an empty array.
     
     - Returns: An array of ChecklistModel's
     */
    func loadData() -> [ChecklistModel] {
        guard let data  = try? Data(contentsOf: fileURL),
              let model = try? JSONDecoder().decode([ChecklistModel].self, from: data) else {
            return []
        }
        return model
    }
        
    /**
     Has filename of "checklists.json" appended to the document directory of the app.
     */
    var fileURL: URL {
        let fileName = "checklists.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        print(documentDir)
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    /**
     Saves an array of ChecklistModel's to the fileURL.
     
     - Parameter checklists: An array of ChecklistModel's
     */
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
