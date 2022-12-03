//
//  SecondViewController.swift
//  cearting TableView
//
//  Created by Admin on 25/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteField: UITextView!
    
    public var completion: ((String,String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.becomeFirstResponder() // it will show keyboard for it
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
    }
    @objc func didTapSave(){
        if let text = titleField.text, !noteField.text.isEmpty {
            
            completion!(text, noteField.text)
        }
    }
   
    


}
