//
//  WriteOutput.swift
//  HashCodeOQ
//
//  Created by Andrew Chersky on 2/23/17.
//  Copyright © 2017 Dmitriy Karachentsov. All rights reserved.
//

import Foundation


class Output {
    fileprivate let path = "/Users/dilames/Desktop/HashCodeOQ/HashCodeOQ/data/example.in"
    
    
    func write(totalCacheNumber: Int, caches: [Cache]) {
        var data = "\(totalCacheNumber)"
        
        
        for cache in caches {
            data += "\n"
            data += "\(cache.index) "
            
            for video in cache.videos {
                
                data += "\(video.number) "
            }
        }
        
        
        do {
            let fileUrl = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create:true).appendingPathComponent("output.in")
            
            try data.write(to: fileUrl, atomically: true, encoding: .utf8)
            
            
        } catch {
            print("Error while assembling output file")
        }
    }
}
