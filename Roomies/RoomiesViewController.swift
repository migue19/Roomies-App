//
//  RoomiesViewController.swift
//  Roomies
//
//  Created by Miguel Mexicano on 07/07/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import UIKit

class RoomiesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var roomies = ["Ariel", "Enrique", "Bruno","Miguel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        roomies.sort()
        
    }
    
    
    
    func setUpCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        collectionView!.collectionViewLayout = layout
    }
}




extension RoomiesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RommiesCellCollectionViewCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RommiesCellCollectionViewCell
        //cell.backgroundColor = .green
        cell.nameLabel.text = roomies[indexPath.row]
        return cell
    }
    
    
}

extension RoomiesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tam = (collectionView.frame.size.width / 3) - 20
        return CGSize(width: CGFloat(tam), height: CGFloat(tam))
    }
}
