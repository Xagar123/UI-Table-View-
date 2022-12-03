//
//  FirstTableViewController.swift
//  Table View Edit row updation
//
//  Created by Admin on 28/11/22.
//

import UIKit

class FirstTableViewController: UITableViewController, passingDataBack {
    
    var selectedData: String = ""
    var rowNumber: Int = 0
    
    var student:[String] = ["A","B","C"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return student.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = student[indexPath.row]
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedData = student[indexPath.row]
        rowNumber = indexPath.row
        
        performSegue(withIdentifier: "mySegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination: SecondViewController = segue.destination as! SecondViewController
        destination.delegate = self
        destination.dataPass = selectedData
    }
    
    func updateData(updatedTitle: String) {
        student[rowNumber] = updatedTitle
        tableView.reloadData()
    }

}
