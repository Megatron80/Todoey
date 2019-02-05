//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Scott Cowie on 12/13/18.
//  Copyright © 2018 Scott Cowie. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
        
    }

    // Mark: - Tableview Dataource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories?.count ?? 1
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
        
        return cell
        
        
    }
    
    //Mark: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    //Mark: -  Data Manupulation Methods
    
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving Category, \(error)")
        }
        tableView.reloadData()
        
    }
    
    func loadCategories() {
    
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
        
    }
    
//    func loadItems(with request : NSFetchRequest<Category> = Category.fetchRequest()){
//        
//        do {
//            categoryArray = try context.fetch(request)
//        } catch {
//            print("Error fetchingdata from context \(error)")
//        }
//        
//    }
    
    
    //Mark: - Add New Categories
   

    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            
            // what will happen when the user clicks the add item button in our UIAlert
            
            
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
            
        }
        
        alert.addAction(action)
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Category"
            textField = alertTextField
        }
        
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
}
