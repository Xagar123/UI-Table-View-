//
//  SecondViewController.swift
//  Table View Edit row updation
//
//  Created by Admin on 28/11/22.
//

import UIKit

protocol passingDataBack {
    func updateData(updatedTitle: String)
}
class SecondViewController: UIViewController {
    

    @IBOutlet weak var textField: UITextField!
    
    var dataPass: String?
    var delegate:passingDataBack!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting data into text field which we received from VC1
        textField.text = dataPass!
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let newStudent = textField.text!
        delegate.updateData(updatedTitle: newStudent)
        dismiss(animated: true,completion: nil)
    }
    
   

}
