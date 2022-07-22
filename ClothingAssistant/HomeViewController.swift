//
//  ViewController.swift
//  ClothingAssistant
//
//  Created by CoopStudent on 7/21/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func AddClothingButtonPressed(_ sender: AnyObject) {
        print("Button pressed")
        self.performSegue(withIdentifier: "AddClothesViewSeague", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBrown
        // Do any additional setup after loading the view.
        
        print("View has loaded")
    }


}

