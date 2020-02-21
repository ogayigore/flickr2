//
//  Model.swift
//  Flickr
//
//  Created by Игорь Огай on 15.02.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

struct Post {
    let id: String
    let title: String
    let url: URL
}

extension Post: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case secret
        case server
        case farm
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        
        let secret = try values.decode(String.self, forKey: .secret)
        let server = try values.decode(String.self, forKey: .server)
        let farm = try values.decode(Int.self, forKey: .farm)
        
        url = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg")!
    }
}

struct Photos: Decodable {
    let photo: [Post]
}

struct Response: Decodable {
    let photos: Photos
}
