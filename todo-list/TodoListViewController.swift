//
//  TodoListViewController.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, AddItemViewControllerProtocol {

    static let Title = "Todo List"
    static let CellIdentifier = "CellIdentifier"
    
    @IBOutlet weak var tableView: UITableView?
    
    var items: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = TodoListViewController.Title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "didTapAdd:")
        
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: TodoListViewController.CellIdentifier)
    }
    
    // MARK: AddItemViewControllerProtocol

    func addItem(item: String) {
        print(item)
    }
    
    // MARK: UITableView DataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(TodoListViewController.CellIdentifier)!
        
        let item = self.items[indexPath.row] as! String
        cell.textLabel?.text = item
        
        return cell
    }
    
    // MARK: Actions
    
    func didTapAdd(sender: UIBarButtonItem) {
        
        let viewController = AddItemViewController()
        viewController.delegate = self
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.view.backgroundColor = UIColor.whiteColor()

        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}
