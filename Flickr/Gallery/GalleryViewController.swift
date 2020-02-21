//
//  GalleryViewController.swift
//  Flickr
//
//  Created by Игорь Огай on 15.02.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import UIKit
import Kingfisher

protocol GalleryViewControllerInput {
    var output: GalleryViewControllerOutput? { get set }
}

protocol GalleryViewControllerOutput {
    func getPosts()
}

class GalleryViewController: UIViewController, GalleryViewControllerInput {
    
    var output: GalleryViewControllerOutput?
    
    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    private let kTableViewCell = UINib(nibName: "PostTableViewCell", bundle: nil)
    private let kTableViewReuseIdentifier = "kPostTableViewReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        output?.getPosts()
        setUpUI()
    }
}

// MARK: - Setting up UI for custom tableView cell

extension GalleryViewController {
    func setUpUI() {
        tableView.register(kTableViewCell, forCellReuseIdentifier: kTableViewReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: TableView protocols implementation

extension GalleryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewReuseIdentifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        cell.nameLabel.text = posts[indexPath.row].title
        cell.photoImageView.kf.setImage(with: posts[indexPath.row].url)
        return cell
    }
}

extension GalleryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postItem = posts[indexPath.row]
    }
}

