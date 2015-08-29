//
//  AddItemViewController.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    static let Title = "Add Item"
    
    @IBOutlet weak var textField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = AddItemViewController.Title
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "didTapCancel:")
        
        self.textField?.becomeFirstResponder()
        self.textField?.delegate = self
    }

    // MARK: UITextFieldDelegate
    
    
    
    
    // MARK: Actions
    
    func didTapCancel(sender: UIBarButtonItem) {

        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
