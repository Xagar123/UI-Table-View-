//
//  ContactsController.swift
//  passing Data back to table view
//
//  Created by Admin on 28/11/22.
//

import UIKit

struct Item {
    var title: String = ""
    var note: String = ""
}

class ContactsController: UITableViewController {
    
    var itemArray = [Item]()
   // var itemArray:[(title:Item, note:Item)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newItem = Item()
        newItem.title = "hello"
        newItem.note = "world"
        //(title:noteTitle, note:note)
        //self.itemArray.append((title:newItem, note:newItem))
        self.itemArray.append(newItem)

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Note Data"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @objc func handleAddContact(){
        let controller = ViewController()
        controller.delegate = self
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        print("item added")
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title as? String
        cell.detailTextLabel?.text = itemArray[indexPath.row].note as? String
        return cell
    }

   
}

extension ContactsController: AddContactDelegate{
    func addContact(item: Item) {
        self.dismiss(animated: true) {
            self.itemArray.append(item)
            self.tableView.reloadData()
        }
    }
    
    
}
