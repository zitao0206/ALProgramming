//
//  Example00.swift
//  Programming
//
//  Created by lizitao on 2023/2/23.
//

import Foundation
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

class Example00 : CommonOpsProtocol {
    var fridgeIsOpen = false
    
    let fridgeContent = ["milk", "eggs", "leftovers"]
    
    func fridgeContains(_ food: String) -> Bool {
        fridgeIsOpen = true
        defer {
            fridgeIsOpen = false
        }
        
        let result = fridgeContent.contains(food)
        return result
    }
    
    func testCase() {
        fridgeContains("banana")
        print(fridgeIsOpen)
        
        
    }
    
}
