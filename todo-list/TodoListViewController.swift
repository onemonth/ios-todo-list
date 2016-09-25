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
    static let CacheKey = "CacheKey"
    
    @IBOutlet weak var tableView: UITableView?
    
    var items: NSMutableArray = NSMutableArray()
    var cache: CacheProtocol = KeyedArchiverCache()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.load()
        
        self.title = TodoListViewController.Title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(TodoListViewController.didTapAdd(_:)))

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: TodoListViewController.CellIdentifier)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        self.tableView?.isEditing = editing
        
        self.navigationItem.rightBarButtonItem?.isEnabled = !editing
    }

    // MARK: AddItemViewControllerProtocol

    func addItem(_ item: String) {
        
        self.items.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView?.insertRows(at: [indexPath], with: UITableViewRowAnimation.right)
        
        self.save()
    }
    
    // MARK: UITableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoListViewController.CellIdentifier)!
        
        let item = self.items[(indexPath as NSIndexPath).row] as? String
        cell.textLabel?.text = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == UITableViewCellEditingStyle.delete {
            
            self.items.removeObject(at: (indexPath as NSIndexPath).row)
            self.tableView?.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
        
            self.save()
        }
    }
    
    // MARK: Actions
    
    func didTapAdd(_ sender: UIBarButtonItem) {
        
        let viewController = AddItemViewController()
        viewController.delegate = self
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.view.backgroundColor = UIColor.white

        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: Cache Actions
    
    func load() {
        let object = self.cache.loadObjectForKey(TodoListViewController.CacheKey)
        
        if let object = object as? NSArray {
            self.items = NSMutableArray(array: object)
        }
    }
    
    func save() {
        self.cache.saveObject(self.items, key: TodoListViewController.CacheKey)
    }
}
