//
//  StudentViewController.swift
//  StudentsUITest
//
//  Created by Lucy Nguyen on 12/24/16.
//  Copyright © 2016 Lucy Nguyen. All rights reserved.
//

import UIKit

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

class StudentViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var student: Student?
    var studentRepository = StudentRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationButtons()
        showStudentInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showStudentInfo() {
        nameTextField.text = student?.name
        addressTextField.text = student?.address
        navigationItem.rightBarButtonItem?.title = student != nil ? "Update" : "Create"
        onStudentNameTextFieldChanged(nameTextField)
    }
    
    @IBAction func onStudentNameTextFieldChanged(_ sender: AnyObject) {
        self.navigationItem.rightBarButtonItem?.isEnabled = nameTextField.text?.characters.count > 0
    }
    
    func onCreateStudentAction(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
        let student = self.student ?? Student()
        let name = student.name
        student.name = nameTextField.text!// ?? ""
        student.address = addressTextField.text ?? ""
        studentRepository.addStudent(student, name: name)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Notifications.newStudentCreated), object: nil)
    }
    
    func onCancelAction(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
}

extension StudentViewController {
    fileprivate func setupNavigationButtons() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(onCreateStudentAction(_:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onCancelAction(_:)))
    }
}

