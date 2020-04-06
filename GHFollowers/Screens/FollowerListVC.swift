//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Patryk Pawlak on 05/04/2020.
//  Copyright © 2020 Patryk Pawlak. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print(followers)
            case.failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "OK")
            }
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
