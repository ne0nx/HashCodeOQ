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
    
    struct ParsedSet {
        var condition: Condition
        var videos: [Video]
        var endpoints: [Endpoint]
        var requests: [Request]
    }
    
    class func dataSet(by set: DataSet) -> ParsedSet {
        
        let path = filePath(by: set)!
        
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
        
        var endpoints = [Endpoint]()
        
        var start_index = 2
        for endpoint_index in 0..<condition.E {
            let endpointComponents = dataSet[start_index+endpoint_index].components(separatedBy: " ")
            
            let endpoint = Endpoint(latency: Int(endpointComponents[0])!)
            endpoint.number = endpoint_index
            let caches_count = Int(endpointComponents[1])!
            
            for cache_index in 0..<caches_count {
                
                let cacheComponents = dataSet[start_index+endpoint_index+cache_index+1].components(separatedBy: " ")
                
                let cache_number = Int(cacheComponents[0])!
                let cache_latency = Int(cacheComponents[1])!
                
                let cache = Cache()
                
                cache.number = cache_number
                cache.latency = cache_latency
                endpoint.addCache(cache)
            }
            
            start_index += caches_count
            
            endpoints.append(endpoint)
        }
        
        start_index += condition.E
        
        var requests = [Request]()
        
        for request_index in 0..<condition.R {
            let requestComponents = dataSet[start_index+request_index].components(separatedBy: " ")
            
            let request = Request()
            
            request.endpoint = Int(requestComponents[1])!
            request.video = Int(requestComponents[0])!
            request.requests_сount = Int(requestComponents[2])!
            requests.append(request)
        }
        
        return ParsedSet(condition: condition, videos: videos, endpoints: endpoints, requests: requests)
    }
    
    class func filePath(by set: DataSet) -> String? {
        let bundle = Bundle.main
        return bundle.path(forResource: set.rawValue, ofType: "in")
    }
    
}
