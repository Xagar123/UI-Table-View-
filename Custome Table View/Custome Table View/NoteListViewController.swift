//
//  ViewController.swift
//  Custome Table View
//
//  Created by Admin on 28/11/22.
//

import UIKit

class NoteListViewController: UITableViewController {
    
    public var itemArray = [Item]()

    var titleData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "First item"
        itemArray.append(newItem)
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(vc, animated: true)
        
      //  vc.delegate = self
        vc.dataPass = titleData
        vc.title = "New Note"
            
        vc.completion = { text in
            self.titleData = text 
           self.navigationController?.popToRootViewController(animated: true)
            print(self.titleData)
        }
        let noteTitle = Item()
        noteTitle.title = titleData
        self.itemArray.append(noteTitle)
    }
    
    
    
    
    // MARK: - Table view Data source method

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = itemArray[indexPath.row].title
        return cell!
    }
    
    // MARK: - Table view delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        debugPrint(itemArray[indexPath.row])
        // we required check mark when it click
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType == .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

