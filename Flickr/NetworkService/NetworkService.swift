//
//  NetworkService.swift
//  Flickr
//
//  Created by Игорь Огай on 15.02.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

protocol NetworkService {
    func flickr(then: @escaping ([Post]) -> Void)
}

class NetworkServiceImpl: NetworkService {
    let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=69fd977268ba709dfa6afe13cd93efeb&format=json&nojsoncallback=1")!
    
    func flickr(then: @escaping ([Post]) -> Void) {
        print("flickr")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                print("получили фотки: \(response.photos.photo.count)")
                then(response.photos.photo)
            } catch {
                print("ошибка - \(error)")
                then([])
            }
        }
        task.resume()
    }
}
