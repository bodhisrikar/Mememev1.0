//
//  MemeDetailViewController.swift
//  Mememev1.0
//
//  Created by Srikar Thottempudi on 2/22/19.
//  Copyright © 2019 Srikar Thottempudi. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    @IBOutlet weak var selectedImage: UIImageView!
    var detailImage: UIImage!
    
    override func viewWillAppear(_ animated: Bool) {
        selectedImage.image = detailImage
    }
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
