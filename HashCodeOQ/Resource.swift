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
    
    class func dataSet(by set: DataSet) -> (Condition, [String]) {
        
        let path = filePath(by: set)
        
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
        
        let data = Array(dataSet[1..<dataSet.count])
        return (condition, data)
    }
    
    class func filePath(by set: DataSet) -> String {
        
        let bundle = Bundle.main
        
        return bundle.path(forResource: set.rawValue, ofType: "in")!
    }
    
}
