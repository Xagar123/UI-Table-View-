//
//  ThirdViewController.swift
//  cearting TableView
//
//  Created by Admin on 25/11/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    

    public var completion: ((String,String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = noteTitle
        noteLabel.text = note
        
        //titleField.becomeFirstResponder() // it will show keyboard for it
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
    }
    @objc func didTapSave(){
//        if let text = titleLabel.text, !noteLabel.text.isEmpty {
//
//            completion!(text, noteLabel.text)
//        }
        navigationController?.popToRootViewController(animated: true)
    }
    

    

}
