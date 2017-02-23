//
//  Condition.swift
//  GCPizzaProject2
//
//  Created by Dmitriy Karachentsov on 4/2/17.
//  Copyright © 2017 Dmitriy Karachentsov. All rights reserved.
//

import Cocoa

class Condition {
    
    /// the number of videos
    var V: Int = 0
    
    /// the number of endpoints
    var E: Int = 0
    
    /// the number of request descriptions
    var R: Int = 0
    
    /// the number of cache servers
    var C: Int = 0
    
    /// the capacity of each cache server in megabytes
    var X: Int = 0
    
    
    /// Init
    ///
    init(V: Int, E: Int, R: Int, C: Int, X: Int) {
        self.V = V
        self.E = E
        self.R = R
        self.C = C
        self.X = X
    }
    
}
