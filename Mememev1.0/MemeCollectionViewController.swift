//
//  MemeCollectionViewController.swift
//  Mememev1.0
//
//  Created by Srikar Thottempudi on 2/20/19.
//  Copyright © 2019 Srikar Thottempudi. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UIViewController {
    var memes: [MememeGenerator]! {

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
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
