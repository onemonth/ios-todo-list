//
//  AddItemViewController.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import UIKit

protocol AddItemViewControllerProtocol {
    func addItem(item: String)
}

class AddItemViewController: UIViewController, UITextFieldDelegate {

    static let Title = "Add Item"
    
    @IBOutlet weak var textField: UITextField?

    var delegate: AddItemViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = AddItemViewController.Title
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "didTapCancel:")
        
        self.textField?.becomeFirstResponder() // If you don't see the keyboard, in simulator toggle soft keyboard
        self.textField?.delegate = self
    }
    
    func dismiss() {
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            
            if let delegate = self.delegate, let item = self.textField?.text where item.characters.count > 0 {
                
                delegate.addItem(item)
                
            }
            
        }
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        self.dismiss()
        
        return false
    }
    
    // MARK: Actions
    
    func didTapCancel(sender: UIBarButtonItem) {

        self.dismiss()
    }
    
}
