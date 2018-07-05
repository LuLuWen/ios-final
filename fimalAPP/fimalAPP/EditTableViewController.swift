//
//  EditTableViewController.swift
//  fimalAPP
//
//  Created by User11 on 2018/6/26.
//  Copyright © 2018年 WilhelmShen. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {
    
    var lover: Lover?
    
    @IBOutlet weak var songTextField: UITextField!
    
    @IBOutlet weak var authorTextField: UITextField!
    
    @IBOutlet weak var albumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lover = lover {
            songTextField.text = lover.song
            authorTextField.text = lover.author
            albumTextField.text = lover.album
        }
    }
    
   
    
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
    
    
   
    
   @IBAction func doneButtonPressed(_ sender: Any) {
        
        if songTextField.text?.count == 0 {
            let alertController = UIAlertController(title: "請輸入歌曲", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        performSegue(withIdentifier: "goBackToTableWithSegue", sender: nil)
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if lover == nil {
            lover = Lover(song: songTextField.text!, author: authorTextField.text!, album: albumTextField.text!)
        } else {
            lover?.song = songTextField.text!
            lover?.author = authorTextField.text!
            lover?.album = albumTextField.text!
            
        }
    }
    
    
}

