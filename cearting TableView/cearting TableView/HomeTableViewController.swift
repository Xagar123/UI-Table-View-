//
//  HomeTableViewController.swift
//  cearting TableView
//
//  Created by Admin on 25/11/22.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var model:[(title: String, note: String)] = []
    //var student:[String] = ["a","b"]
    var selectedData: String = ""
    var rowNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Note"
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        guard  let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
        
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.model.append((title:noteTitle, note:note))
           // self.label.isHidden = true
           // self.table.isHidden = false
            self.tableView.reloadData()
        }
        
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = model[indexPath.row].title
        cell?.detailTextLabel?.text = model[indexPath.row].note
        return cell!
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = model[indexPath.row]
        //show note controller
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
