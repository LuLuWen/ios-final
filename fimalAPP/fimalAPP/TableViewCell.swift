//
//  TableViewCell.swift
//  fimalAPP
//
//  Created by User11 on 2018/6/26.
//  Copyright © 2018年 WilhelmShen. All rights reserved.
//


import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
