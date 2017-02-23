//
//  DataProvider.swift
//  HashCodeOQ
//
//  Created by Andrew Chersky on 2/23/17.
//  Copyright © 2017 Dmitriy Karachentsov. All rights reserved.
//

import Foundation

class F {
    static let kittens = "/Users/dilames/Desktop/HashCodeOQ/HashCodeOQ/Recources/kittens.in"
    static let videos = "/Users/dilames/Desktop/HashCodeOQ/HashCodeOQ/Recources/trending_today.in"
    static let trending = "/Users/dilames/Desktop/HashCodeOQ/HashCodeOQ/Recources/videos_worth_spreading.in"
}

class DataProvider {
    static let `default` = DataProvider()
    
    private(set) var video: Int = 0
    private(set) var user: Int = 0
    private(set) var request: Int = 0
    private(set) var cache: Int = 0
    private(set) var cacheSize: Int = 0
    
    init() {
        self.parce(from: F.kittens)
    }
    
    // MARK: File parcing
    private func parce(from file: String) {
        do {
            var array = [String]()
            
            let data = try String(contentsOfFile: file)
            _ = data.components(separatedBy: "\n").map { array.append($0) }
            
            let values = array[0].components(separatedBy: " ")
            self.video = Int(values[0])!
            self.user       = Int(values[1])!
            self.request    = Int(values[2])!
            self.cache      = Int(values[3])!
            self.cacheSize  = Int(values[4])!
            
            
            print(self.video)
        } catch {
            
        }
    }
}
