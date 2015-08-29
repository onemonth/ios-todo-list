//
//  AddItemViewController.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    static let Title = "Add Item"
    
    @IBOutlet weak var textView: UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = AddItemViewController.Title
        
        self.edgesForExtendedLayout = UIRectEdge.None
    }

}
