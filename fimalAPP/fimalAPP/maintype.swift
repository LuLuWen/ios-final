//
//  maintype.swift
//  fimalAPP
//
//  Created by User11 on 2018/6/26.
//  Copyright © 2018年 WilhelmShen. All rights reserved.
//

import Foundation
import UIKit

struct Lover: Codable{
    var song: String
    var author: String
    var album: String





     static func readLoversFromFile() -> [Lover]? {
        let propertyDecoder = PropertyListDecoder()
        if let data = UserDefaults.standard.data(forKey: "lovers"), let lovers = try? propertyDecoder.decode([Lover].self, from: data) {
            return lovers
        } else {
            return nil
        }
    }
    
     static func saveToFile(lovers: [Lover]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(lovers) {
            UserDefaults.standard.set(data, forKey: "lovers")
        }
    }
}

