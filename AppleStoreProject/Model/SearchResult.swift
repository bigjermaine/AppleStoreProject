//
//  SearchResult.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 10/10/2023.
//

import Foundation


struct SearchResult:Codable {
    let resultCount:Int
    let results:[Result]
    
}

struct Result:Codable {
    let trackName:String
    let primaryGenreName:String
    let averageUserRating:Float?
    let screenshotUrls:[String]
    let artworkUrl100:String
    
    
}
