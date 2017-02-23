//
//  Request.swift
//  HashCodeOQ
//
//  Created by Dmitriy Karachentsov on 23/2/17.
//  Copyright © 2017 Dmitriy Karachentsov. All rights reserved.
//

import Cocoa

class Request: NSObject {

    weak var endpoint: Endpoint?
    
    var requestsCount: Int = 0
    
    weak var video: Video?
    
}
