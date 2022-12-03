//
//  ViewController.swift
//  passing Data back to table view
//
//  Created by Admin on 28/11/22.
//

import UIKit

protocol AddContactDelegate {
    func addContact(item: Item)
}

class ViewController: UIViewController {
    
    var delegate: AddContactDelegate?

    let textField: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter here"
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSaveButton))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel
                                                                , target: self, action: #selector(handleCancelButton))
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        textField.becomeFirstResponder()
    }

    //MARK: - Selector
    
    @objc func handleSaveButton(){
        
        guard let fullName = textField.text, textField.hasText else {
            print("Handle error")
            return}
        let item = Item(title: textField.text!)
        print(item.title)
        
        delegate?.addContact(item: item)
    }
    
    @objc func handleCancelButton(){
        self.dismiss(animated: true,completion: nil)
    }

}

