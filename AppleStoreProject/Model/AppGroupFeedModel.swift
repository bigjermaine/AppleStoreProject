//
//  AppGroupFeed.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 20/10/2023.
//

import Foundation
struct FeedResponse: Decodable {
    let feed: Feed
}


struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
   // let links: [Link]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [FeedResult]
}

struct Author: Codable  {
    let name: String
    let url: String
}
//
//struct Link: Codable {
//    let `self`: String
//}

struct FeedResult: Codable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: String
    let kind: String
    let artworkUrl100: String
    let genres: [String]
    let url: String
}

struct SocialApp:Codable {
    var id,name,imageUrl:String
    var tagline:String?
}
