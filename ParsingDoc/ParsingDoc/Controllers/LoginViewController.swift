//
//  ViewController.swift
//  ParsingDoc
//
//  Created by Talish George on 17/6/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel?
    
    static func instantiate() -> LoginViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(withIdentifier:   "LoginViewController") as! LoginViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    @IBAction func userTappedDetailsButton(_ sender: Any) {
        viewModel?.invokeHomeButton()
    }
}

