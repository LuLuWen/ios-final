//
//  ViewController.swift
//  PhotoDemo
//
//  Created by SHIH-YING PAN on 2018/6/20.
//  Copyright © 2018 SHIH-YING PAN. All rights reserved.
//

import UIKit

class ViewControllerPhoto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func choosePhoto(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true, completion: nil)
        
        
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



