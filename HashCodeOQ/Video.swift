//
//  Video.swift
//  HashCodeOQ
//
//  Created by Dmitriy Karachentsov on 23/2/17.
//  Copyright © 2017 Dmitriy Karachentsov. All rights reserved.
//

import Cocoa

class Video: NSObject {
    
    var number: Int = 0
    
    var megabytes: Int = 0
    
    init(number: Int, megabytes: Int) {
        self.number = number
        self.megabytes = megabytes
    }
    
}
