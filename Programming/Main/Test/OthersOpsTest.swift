//
//  OthersOpsTest.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class Person {
    var name: String {
        didSet {
            notifyObservers()
        }
    }
    
    private var observers = [PersonObserver]()
    
    init(name: String) {
        self.name = name
    }
    
    func registerObserver(_ observer: PersonObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: PersonObserver) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.personNameDidChange(to: name)
        }
    }
}
// 观察者
protocol PersonObserver: AnyObject {
    func personNameDidChange(to name: String)
}
class Teacher: PersonObserver {
    func personNameDidChange(to name: String) {
        print("Teacher: \(name), please take your seat.")
    }
}
class Student: PersonObserver {
    func personNameDidChange(to name: String) {
        print("Student: Oh, my name is \(name) now.")
    }
}


class OthersOpsTest : CommonOpsProtocol {
 
    func testCase() {
        
        // 使用示例
        let person = Person(name: "Jack")
        let teacher = Teacher()
        let student = Student()
        person.registerObserver(teacher)
        person.registerObserver(student)
        person.name = "Rose"
        
        //let readMe = OpsForReadMe()
        //readMe.testCase()
    }
}


