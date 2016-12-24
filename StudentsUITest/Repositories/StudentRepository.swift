//
//  StudentRepository.swift
//  StudentsUITest
//
//  Created by Lucy Nguyen on 12/24/16.
//  Copyright © 2016 Lucy Nguyen. All rights reserved.
//

import RealmSwift

class StudentRepository: NSObject {
    
    let realm: Realm
    
    override init() {
        realm = try! Realm()
    }

    func getListStudent() -> [Student] {
        let entities = realm.objects(StudentEntity.self)
        var students = [Student]()
        
        for entity in entities {
            let student = Mapper.student(from: entity)
            students.append(student)
        }
        
        return students
    }
    
    func deleteStudent(_ student: Student) {
        try! realm.write {
            let entity = StudentEntity()
            Mapper.map(fromObject: student, to: entity)
            realm.delete(entity)
        }
    }
    
    func addStudent(_ student: Student, name: String) {
        try! realm.write {
            let entity = realm.objects(StudentEntity.self).filter({$0.name == name}).first ?? StudentEntity()
            Mapper.map(fromObject: student, to: entity)
            realm.add(entity)
        }
    }
}
