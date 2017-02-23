//
//  Resource.swift
//  GCPizzaProject2
//
//  Created by Dmitriy Karachentsov on 4/2/17.
//  Copyright © 2017 Dmitriy Karachentsov. All rights reserved.
//

import Cocoa

class Resource: NSObject {

    enum DataSet: String {
        case example
        case kittens
        case me_at_the_zoo
        case trending_today
        case videos_worth_spreading
    }
    
    class func dataSet(by set: DataSet) -> (Condition, [String])? {
        
        guard let path = filePath(by: set) else {
            return nil
        }
        
        let string = try! String(contentsOfFile: path, encoding: .utf8)
        let components = string.components(separatedBy: "\n")
        let dataSet = components.filter { $0.characters.count != 0 }
        
        let headerComponents = dataSet.first!.components(separatedBy: " ")
        
        let condition = Condition(
            V: Int(headerComponents[0])!,
            E: Int(headerComponents[1])!,
            R: Int(headerComponents[2])!,
            C: Int(headerComponents[3])!,
            X: Int(headerComponents[4])!
        )
        
        let videosComponents = dataSet[1].components(separatedBy: " ")
        let videos = videosComponents.enumerated().map { (index, megabytes) -> Video in
            Video(number: index, megabytes: Int(megabytes)!)
        }
        
        var start_endpoint_index = 2
        for endpoint_index in 0..<condition.E {
            let endpointComponents = dataSet[start_endpoint_index+endpoint_index].components(separatedBy: " ")
            
            let endpoint = Endpoint(latency: Int(endpointComponents[0])!)
            let caches_count = Int(endpointComponents[1])!
            
            for cache_index in 0..<caches_count {
                
            }
            
        }
        
        let data = Array(dataSet[1..<dataSet.count])
        return (condition, data)
    }
    
    class func filePath(by set: DataSet) -> String? {
        let bundle = Bundle.main
        return bundle.path(forResource: set.rawValue, ofType: "in")
    }
    
}
