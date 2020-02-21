//
//  Coordinator.swift
//  Flickr
//
//  Created by Игорь Огай on 15.02.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation
import UIKit

class NetworkAssembly {
    var networkService: NetworkService {
        return NetworkServiceImpl()
    }
}

class CoordinatorAssembly {
    let networkAssembly = NetworkAssembly()
    init() {}
    var coordinator: Coordinator {
        let coordinator = Coordinator()
        coordinator.networkService = networkAssembly.networkService
        return coordinator
    }
}

class Coordinator {
    
    public var window: UIWindow?
    var networkService: NetworkService?
    
    private var galleryVC: GalleryViewController?
    private var fullscreenVC: FullscreenViewController?
    
    func start() -> UIViewController {
        print("START")
        let galleryVC = vc("GalleryViewController") as! GalleryViewController
        window?.rootViewController = galleryVC
        self.galleryVC = galleryVC
        return galleryVC
    }
}

extension Coordinator: GalleryViewControllerOutput {
    func getPosts() {
        print("getPosts")
        networkService?.flickr(then: { (posts) in
            self.galleryVC?.posts = posts
        })
    }
}

extension Coordinator {
    func vc(_ id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id)
    }
}
