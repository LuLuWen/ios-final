//
//  TableViewController.swift
//  fimalAPP
//
//  Created by User11 on 2018/6/26.
//  Copyright © 2018年 WilhelmShen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var lovers = [Lover]()
    
    @IBAction func goBackToTable(segue: UIStoryboardSegue) {
        let controller = segue.source as? EditTableViewController
        
        if  let lover = controller?.lover {
            if let row = tableView.indexPathForSelectedRow?.row {
                lovers[row] = lover
            } else {
                lovers.insert(lover, at: 0)
            }
            
            Lover.saveToFile(lovers: lovers)
            
            
            tableView.reloadData()
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let lovers = Lover.readLoversFromFile() {
            self.lovers = lovers
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        lovers.remove(at: indexPath.row)
        Lover.saveToFile(lovers: lovers)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lovers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loverCell", for: indexPath) as! TableViewCell
        
        let lover = lovers[indexPath.row]
        cell.songLabel.text = lover.song
        cell.authorLabel.text = lover.author
        cell.albumLabel.text = lover.album
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let row = tableView.indexPathForSelectedRow?.row {
            let lover = lovers[row]
            let controller = segue.destination as? EditTableViewController
            controller?.lover =  lover
        }
    }
    
    
}
