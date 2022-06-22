//
//  DetailsViewController.swift
//  ParsingDoc
//
//  Created by Talish George on 17/6/22.
//

import UIKit

class HomeViewController: UITableViewController {

    var viewModel: HomeViewModel?
    
    static func instantiate() -> HomeViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel?.viewDidDisappear()
    }
}
