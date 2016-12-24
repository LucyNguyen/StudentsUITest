//
//  Student.swift
//  StudentsUITest
//
//  Created by Lucy Nguyen on 12/24/16.
//  Copyright © 2016 Lucy Nguyen. All rights reserved.
//

import RealmSwift

class Student {
    var name: String = ""
    var address: String = ""
    
}

class StudentEntity: Object {
    dynamic var name: String = ""
    dynamic var address: String = ""

}

class Mapper {
    class func map(fromEntity entity: StudentEntity, to student: Student) {
        student.name = entity.name
        student.address = entity.address
    }
    
    class func map(fromObject student: Student, to entity: StudentEntity) {
        entity.name = student.name
        entity.address = student.address
    }
    
    class func student(from entity: StudentEntity) -> Student {
        let student = Student()
        map(fromEntity: entity, to: student)
        return student
    }
}
