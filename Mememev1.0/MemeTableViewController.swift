//
//  MemeTableViewController.swift
//  Mememev1.0
//
//  Created by Srikar Thottempudi on 2/20/19.
//  Copyright © 2019 Srikar Thottempudi. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController {
    @IBOutlet weak var memeTableView: UITableView!
    var memes: [MememeGenerator]! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Refreshing memes array for new memes created
        memeTableView.reloadData()
    }

}

extension MemeTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memeCell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")
        let memeAtPosition = memes[indexPath.row]
        memeCell?.imageView?.image = memeAtPosition.memeMeImage
        memeCell?.textLabel?.text = "\(memeAtPosition.topTextFieldInImage + memeAtPosition.bottomTextFieldInImage)"
        return memeCell!
    }
    
}
