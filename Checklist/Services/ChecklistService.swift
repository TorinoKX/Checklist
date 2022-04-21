//
//  ChecklistService.swift
//  Checklist
//
//  Created by zak on 21/4/2022.
//

import Foundation

class ChecklistService {
    func loadData() -> [ChecklistModel] {
        guard let data  = try? Data(contentsOf: fileURL),
              let model = try? JSONDecoder().decode([ChecklistModel].self, from: data) else {
            return []
        }
        return model
    }
        
    var fileURL: URL {
        let fileName = "checklists.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        print(documentDir)
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

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
