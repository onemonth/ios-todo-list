//
//  AddItemViewController.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import UIKit

protocol AddItemViewControllerProtocol {
    func addItem(_ item: String)
}

class AddItemViewController: UIViewController, UITextFieldDelegate {

    static let Title = "Add Item"
    
    @IBOutlet weak var textField: UITextField?

    var delegate: AddItemViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = AddItemViewController.Title
        
        self.edgesForExtendedLayout = UIRectEdge()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(AddItemViewController.didTapCancel(_:)))
        
        self.textField?.becomeFirstResponder() // If you don't see the keyboard, in simulator toggle soft keyboard
        self.textField?.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        self.dismiss()
        
        return false
    }
    
    // MARK: Actions
    
    func didTapCancel(_ sender: UIBarButtonItem) {

        self.dismiss()
    }
    
    // MARK: Private API
    
    func dismiss() {
        
        self.dismiss(animated: true) { () -> Void in
            
            if let delegate = self.delegate, let item = self.textField?.text , item.characters.count > 0 {
                
                delegate.addItem(item)
                
            }
            
        }
    }

}
