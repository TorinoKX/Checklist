//
//  ChecklistTests.swift
//  ChecklistTests
//
//  Created by zak on 26/3/2022.
//

import XCTest
@testable import Checklist

class ChecklistTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCheckItemModel() throws {
        let item: CheckItemModel = CheckItemModel(name: "", isChecked: false, oldChecked: false)
        var item2: CheckItemModel = CheckItemModel()
        let jeff: String = "Jeff"
        let t: Bool = true
        
        //Test default values
        XCTAssert(item.name == item2.name)
        XCTAssert(item.isChecked == item2.isChecked)
        XCTAssert(item.oldChecked == item2.oldChecked)
        
        //Test changing values and typing
        item2.name = jeff
        XCTAssert(item2.name == jeff)
        item2.isChecked = t
        XCTAssert(item2.isChecked == t)
        item2.oldChecked = t
        XCTAssert(item2.oldChecked == t)
    }
    
    func testChecklistModel() throws {
        let checkList: ChecklistModel = ChecklistModel(items: [], name: "Checklist")
        var checkList2: ChecklistModel = ChecklistModel()
        let items: [CheckItemModel] = [CheckItemModel()]
        let name: String = "New name"
        
        //Test default values
        XCTAssert(checkList.items == checkList2.items)
        XCTAssert(checkList.name == checkList2.name)
        
        //Test changing values and typing
        checkList2.items = items
        XCTAssert(checkList2.items == items)
        checkList2.name = name
        XCTAssert(checkList2.name == name)
    }
    
    func testChecklistViewModel() throws {
        let checkList: ChecklistViewModel = ChecklistViewModel()
        let checkList2: ChecklistViewModel = ChecklistViewModel(checkList: ChecklistModel())
        let checkList3: ChecklistViewModel = ChecklistViewModel()
        let name: String = "Jeff"
        let item: CheckItemModel = CheckItemModel()
        let items: [CheckItemModel] = [item]
        let t: Bool = true
        
        //Test default values
        XCTAssert(checkList.checkList == checkList2.checkList)
        XCTAssert(checkList.name == checkList2.name)
        XCTAssert(checkList.items == checkList2.items)
        XCTAssert(checkList.undoToggled == checkList2.undoToggled)

        //Test changing values and typing
        checkList2.name = name
        XCTAssert(checkList2.name == name)
        checkList2.items = items
        XCTAssert(checkList2.items == items)
        checkList2.undoToggled = t
        XCTAssert(checkList2.undoToggled == t)
        
        //Test functions
        checkList3.addElement(item: item)
        XCTAssert(checkList3.items == [item])
        checkList3.items[0].isChecked = true
        checkList3.toggleUndo()
        XCTAssert(checkList3.undoToggled == true)
        for i in checkList3.items.indices {
            XCTAssert(checkList3.items[i].oldChecked == true)
            XCTAssert(checkList3.items[i].isChecked == false)
        }
        checkList3.toggleUndo()
        XCTAssert(checkList3.undoToggled == false)
        for i in checkList3.items.indices {
            XCTAssert(checkList3.items[i].oldChecked == false)
            XCTAssert(checkList3.items[i].isChecked == true)
        }
    }
    
    func testMasterlistViewModel() throws {
        let masterList: MasterlistViewModel = MasterlistViewModel(items: [])
        let masterList2: MasterlistViewModel = MasterlistViewModel()
        let items: [ChecklistViewModel] = [ChecklistViewModel()]
        
        //Test default values
        XCTAssert(masterList.items == masterList2.items)
        XCTAssert(masterList.isLoading == masterList2.isLoading)
        
        //Test changing values and typing
        masterList2.items = items
        XCTAssert(masterList2.items == items)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
