//
//  main.swift
//  HashCodeOQ
//
//  Created by Dmitriy Karachentsov on 23/2/17.
//  Copyright © 2017 Dmitriy Karachentsov. All rights reserved.
//

import Foundation

func a() {
    
    let res = Resource.dataSet(by: .example)
    
    let endpoints = res.endpoints
    let requests = res.requests

    var cache_latency_used: [Int: (Int, Int)] = [:]
    
    for endpoint in endpoints {
        for cache in endpoint.caches {
            if let (latency, used) = cache_latency_used[cache.number] {
                cache_latency_used[cache.number] = (latency + cache.latency, used + 1)
            } else {
                cache_latency_used[cache.number] = (cache.latency, 1)
            }
        }
    }
    
    print("------------------------")
    print("Cache/Latency/Used")
    cache_latency_used.forEach { (key , value) in
        print("\(key) - \(value.0) \(value.1)")
    }
    
    var cache_score: [Int: Int] = [:]
    for cache in cache_latency_used {
        cache_score[cache.key] = cache.value.0/cache.value.1
    }
    
    print("------------------------")
    print("Cache/Score")
    cache_score.forEach { (key, value) in
        print("\(key) - \(value)")
    }
    
    var video_requests: [Int: Int] = [:]
    
    for request in requests {
        
        if let requests_count = video_requests[request.video] {
            video_requests[request.video] = requests_count + request.requests_сount
        } else {
            video_requests[request.video] = request.requests_сount
        }
    }
    
    print("------------------------")
    print("Video/Requests")
    video_requests.forEach { (key, value) in
        print("\(key) - \(value)")
    }
    
    // more popular caches
    
//    var latencies: [Cache: Int] = [:]
//    
//    for cache in caches {
//        latencies[cache] = 0
//    }
//    
//    for endpoint in endpoints {
//        
//        for cache in endpoint.caches {
//            latencies[cache.key] = latencies[cache.key]! + cache.value
//        }
//        
//    }
//    
//    let sorded_latencies = latencies.sorted { (latency1, latency2) -> Bool in
//        return latency1.value < latency2.value
//    }
//    
//    print(sorded_latencies)
//    
//    // more popular videos
//    
//    let requests = res.4
//    
//    var most_popular_videos: [Video : Int] = [:]
//    
//    for request in requests {
//        let video = request.video!
//        if most_popular_videos[video] == nil {
//            most_popular_videos[video] = 0
//        }
//        most_popular_videos[video] = most_popular_videos[video]! + 1
//    }
//    
//    let sorted_most_popular_videos = most_popular_videos.sorted { (video1, video2) -> Bool in
//        video1.value > video2.value
//    }
// 
//    print(sorted_most_popular_videos)
    
}


a()
