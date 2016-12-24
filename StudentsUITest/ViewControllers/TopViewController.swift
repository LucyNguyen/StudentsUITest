//
//  TopViewController.swift
//  StudentsUITest
//
//  Created by Lucy Nguyen on 12/24/16.
//  Copyright © 2016 Lucy Nguyen. All rights reserved.
//

import UIKit
import RealmSwift

class TopViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noRecordLabel: UILabel!
    
    var students: [Student]?//Results<Student>?
    var studentRepository = StudentRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateNotes()
        NotificationCenter.default.addObserver(self, selector: #selector(onNewNoteCreated), name: NSNotification.Name(rawValue: Notifications.newStudentCreated), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAddStudentAction(_ sender: Any) {
    }

    func onNewNoteCreated() {
        updateNotes()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStudentDetailSegue" {
            if let destinationViewController = segue.destination as? StudentViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let student = students?[index.row]
                    destinationViewController.student = student
                }
            }
        }
    }

}

extension TopViewController {
    func updateNotes() {
        students = studentRepository.getListStudent()
        updateTableViewVisibility()
    }
    
    func updateTableViewVisibility() {
        noRecordLabel.isHidden = (students?.count)! > 0
        tableView.isHidden = !noRecordLabel.isHidden
    }
}

extension TopViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.defaultCellWithReuseID("studentCell") as! StudentCell
        let student = students![indexPath.row]
        cell.setContent(name: student.name, address: student.address)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            studentRepository.deleteStudent(students![indexPath.row])
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            tableView.endUpdates()
            updateTableViewVisibility()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
