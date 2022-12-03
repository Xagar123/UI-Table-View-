//
//  ViewController.swift
//  tableVC custom cell
//
//  Created by Admin on 30/11/22.
//

import UIKit

//creating model
class UserModel{
    var userImage: UIImage?
    var name: String?
    var age: String?
    
    init(userImage: UIImage, name: String, age: String) {
        self.userImage = userImage
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {

    var tableView = UITableView()
    
    var userArray = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        userArray.append(UserModel(userImage: UIImage(imageLiteralResourceName: "language"), name: "Sagar", age: "22anacidabv xndvbhd hbdvkds cjbvlabd fc svjbn nfisfsacmjsfjsf fba fn bfhb d,bnxvhb bbbbbbbbbbbbbbbbxr "))
        userArray.append(UserModel(userImage: UIImage(imageLiteralResourceName: "language"), name: "Alok", age: "22anacidabv xndvbhd hbdvkds cjbvlabd fc svjbn nfisfsacmjsfjsf fba fn bfhb d,bnxvhb bbbbbbbbbbbbbbbbxr "))
    }


    func setTableView(){
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.separatorColor = UIColor.clear
       // tableView.rowHeight = 300
        tableView.backgroundColor = UIColor.blue
        self.view.addSubview(tableView)
        tableView.register(CustomeTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomeTableViewCell else {fatalError("unable to create cell")}
        cell.userImage.image = userArray[indexPath.row].userImage
        cell.namelbl.text = userArray[indexPath.row].name
        cell.agelbl.text = userArray[indexPath.row].age
        cell.backgroundColor = UIColor.white
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("height func")
        return 120.0
    }
    
    
}
