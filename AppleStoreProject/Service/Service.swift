//
//  Service.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 10/10/2023.
//

import Foundation

public class Services {
    
    static let shared = Services()
     
    
    func fetchItunesApps(searchText:String,completion:@escaping([Result]) -> ()) {
        guard  searchText != "" else {
            let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
            searchUrlDowload(url:urlString, completion:  { result in
                completion(result)
            })
            return
        }
        let urlString = "https://itunes.apple.com/search?term=s\(searchText)&entity=software"
        searchUrlDowload(url:urlString, completion: { result in
            completion(result)
        })
    }
    
    func searchUrlDowload(url:String,completion:@escaping([Result]) -> ()) {
        
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch apps:")
                return
            }
            guard let data = data else {return}
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self,from:data)
                completion(searchResult.results)
                
            }catch let jsonErr{
                print(jsonErr.localizedDescription)
                
            }
        }.resume()
        
    }
    
    func fetchGames(completion:@escaping(Feed) -> ()) {
       fetchhelp(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json", completion: completion)
    }
    
    
    
    func fetchTopApps(completion:@escaping(Feed) -> ()) {
       fetchhelp(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/10/apps.json", completion: completion)
    }
    func fetchhelp(urlString:String ,completion:@escaping(Feed) -> ()) {
   
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch apps:")
                return
            }
            guard let data = data else {return}
            do {
                let result = try JSONDecoder().decode(FeedResponse.self,from:data)
              
                completion(result.feed)
            }catch let jsonErr{
                print(jsonErr.localizedDescription)
                
            }
        }.resume()
    }
   
    
    func fetchSocialApps(completion:@escaping([SocialApp]) -> ()) {
        
        guard let url = URL(string: "https://api.letsbuildthatapp.com/appstore/social") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch apps:")
                return
            }
            guard let data = data else {return}
            do {
                let result = try JSONDecoder().decode([SocialApp].self,from:data)
                
                completion(result)
            }catch let jsonErr{
                print(jsonErr.localizedDescription)
                
            }
        }.resume()
    }
    
    
    
    func fetchDetails(id:String,completion:@escaping(SearchResult) -> ()) {
        
        guard let url = URL(string: "https://itunes.apple.com/lookup?id=\(id)") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch apps:")
                return
            }
            guard let data = data else {return}
            do {
                let result = try JSONDecoder().decode(SearchResult.self,from:data)
                
                completion(result)
            }catch let jsonErr{
                print(jsonErr.localizedDescription)
                
            }
        }.resume()
    }
    
    
    

    
}
