//
//  OpsForReadMe.swift
//  Topics
//
//  Created by lizitao on 2022/11/22.
//

import Foundation

class OpsForReadMe : Base {

    let readMePath = "/Users/lizitao/Desktop/Documents/"
    let readMeFilePath = "/Users/lizitao/Desktop/Documents/README.md"
    let threeSpaceString = "   "
    var sourceResultArr:[String] = []
    var contentResultArr:[String] = []
    
    func encodingPathString(_ sourceString : String) -> String {
        return sourceString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    }
    func encodingQueryString(_ sourceString : String) -> String {
        return sourceString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
    func IsfileExists(path:String) -> Bool {
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: path)
    }

    func creatFilePath(path:String) {
        let fileManager = FileManager.default
        fileManager.createFile(atPath: path+"README.md", contents: nil, attributes: nil)
    }

    func removeFilePath(path:String) {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: path)
        } catch {
            print("creat false")
        }
    }
    
    func refreshSourceResultData() {
        if IsfileExists(path: readMeFilePath) {
            removeFilePath(path: readMeFilePath)
        }
        creatFilePath(path: readMePath)
        do {
            let array = try FileManager.default.subpathsOfDirectory(atPath: readMePath)
            sourceResultArr = array.filter({$0.hasSuffix(".md")})
        } catch {
            print("creat false")
        }
    }
    
    func writeContentToFile() {
        let contentResultSting = contentResultArr.reduce("") { a, b in
            a + "   " + "\n" + b
        }
        let resultData = contentResultSting.data(using: String.Encoding.utf8, allowLossyConversion: true)
        let url = NSURL(string: readMeFilePath)
        if let writeHandler = try? FileHandle(forWritingTo:url! as URL) {
            writeHandler.seekToEndOfFile()
            writeHandler.write(resultData!)
            try? writeHandler.close()
        }
    }
    
    
    func obtainTargetResult(_ title:String, _ keyDir: String) {
        contentResultArr.append(title)
        let tempResultArr = sourceResultArr.filter({$0.contains(keyDir)})
        let tempSorterResultArr = tempResultArr.map { obj in
            obj[obj.index(obj.startIndex, offsetBy: ("Swift/" + keyDir + "/").count)..<obj.endIndex]
        }.sorted(by: {$0 < $1})
        contentResultArr = contentResultArr + tempSorterResultArr.map { obj in
            let resultUrl = "("+"https://github.com/Leon0206/Documents/blob/main/Swift/" + encodingPathString(keyDir) + "/" + encodingPathString(String(obj)) + ")"
            let result = obj.split(whereSeparator: {$0 == "."})
            return "* " + "[" + result[0] + "." + result[1] + "]" + resultUrl
        }
        contentResultArr.append("\n")
    }
    
    func mainHanle()  {

        refreshSourceResultData()
        
        //Swift
        let firstTitle_00 = "## For Swift" + "   "
        contentResultArr.append(firstTitle_00)
        
        let titleForItem = { [weak self](keyword: String) -> String in
            let suffix = self?.encodingQueryString("(https://github.com/Leon0206/Documents/tree/main/Swift/" + keyword + ")") ?? ""
            return  "### [" + keyword + "]" + suffix + (self?.threeSpaceString ?? "")
        }
        //Swift Tips
        let tipsDir = "01. Tips"
        let tipsTitle = titleForItem(tipsDir)
        obtainTargetResult(tipsTitle, tipsDir)
      
        //Swift Closures
        let closuresDir = "02. Closures"
        let closuresTitle = titleForItem(closuresDir)
        obtainTargetResult(closuresTitle, closuresDir)
        
        //Swift Structs
        let structsDir = "03. Structs"
        let structsTitle = titleForItem(structsDir)
        obtainTargetResult(structsTitle, structsDir)
        
        //Swift Enumerations
        let enumerationsDir = "04. Enumerations"
        let enumerationsTitle = titleForItem(enumerationsDir)
        obtainTargetResult(enumerationsTitle, enumerationsDir)
        
        //Swift Protocols
        let protocolsDir = "05. Protocols"
        let protocolsTitle = titleForItem(protocolsDir)
        obtainTargetResult(protocolsTitle, protocolsDir)
        
        //Swift Collections
        let collectionsDir = "06. Collections"
        let collectionsTitle = titleForItem(collectionsDir)
        obtainTargetResult(collectionsTitle, collectionsDir)
        
        //Swift Hybrid Programming
        let hybridProgrammingDir = "07. Hybrid Programming"
        let hybridTitle = titleForItem(hybridProgrammingDir)
        obtainTargetResult(hybridTitle, hybridProgrammingDir)

        writeContentToFile()

    }
    
    func testCase() {
  
        mainHanle()
     
        
    }
}
