//
//  ViewController.swift
//  Tables
//
//  Created by Robert D. Brown on 6/24/19.
//  Copyright © 2019 Mobile Makers Edu. All rights reserved.
//

import UIKit
import TableViewReloadAnimation

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var data = ["This","is","so"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    @IBAction func whenAddButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add An Item", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Item Name"
        }
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
            let newItem = alert.textFields?.first?.text
            self.data.append(newItem!)
            self.tableView.reloadData(
                with: .simple(duration: 0.45, direction: .left(useCellsFrame: true),
                              constantDelay: 0))
        }))
        present(alert, animated: true, completion: nil)
        
    }
    

}

