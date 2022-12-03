//
//  SecondViewController.swift
//  Custome Table View
//
//  Created by Admin on 28/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    var dataPass: String?
    
    //var completionHandler = ((String) -> Void)?.self
  //  var completion: completionHandler = nil
    @IBOutlet weak var textFieldEntered: UITextField!
    
    public var completion: ((Item) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldEntered.text = dataPass!
        
    }
    
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        
       
       // guard let text = textFieldEntered.text else {return}
        if let text = textFieldEntered.text {
            
            completion!(text)
        }
        
       dismiss(animated: true, completion: nil)
       navigationController?.popToRootViewController(animated: true)
    }
}
