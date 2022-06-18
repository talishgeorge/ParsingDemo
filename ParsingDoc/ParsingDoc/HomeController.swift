//
//  ViewController.swift
//  ParsingDoc
//
//  Created by Talish George on 17/6/22.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    @IBAction func userTappedDetailsButton(_ sender: Any) {
        
    }
    
}

