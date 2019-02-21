//
//  MemeCollectionViewController.swift
//  Mememev1.0
//
//  Created by Srikar Thottempudi on 2/20/19.
//  Copyright © 2019 Srikar Thottempudi. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UIViewController {
    
    @IBOutlet weak var memeCollectionView: UICollectionView!
    var memes: [MememeGenerator]! {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Updating the memes array for new memes created
        super.viewWillAppear(animated)
        memeCollectionView.reloadData()
    }
}

extension MemeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let memeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        memeCell.cellImage.image = memes[indexPath.row].memeMeImage
        return memeCell
    }
}
