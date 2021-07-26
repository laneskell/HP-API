//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by Kell Lanes on 23/07/21.
//

import UIKit

class HomeViewController: UIViewController {
  
    @IBOutlet weak var cviewPerson: UICollectionView!
    @IBOutlet weak var cviewHouse: UICollectionView!
    var housesImages:[String] = ["lufalufa", "grifinoria", "corvinal", "sonserina"]
    var personImages:[String] = ["harry1", "harry3", "harry4"]
    override func viewDidLoad() {
        super.viewDidLoad()
   
        }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == cviewHouse){
            return housesImages.count
        }
        return personImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cviewPerson.dequeueReusableCell(withReuseIdentifier: "cellPerson", for: indexPath) as! MyCollectionViewCell
        cell.imageViewHouse.image = UIImage(named: personImages[indexPath.row])
        cell.imageViewHouse.layer.cornerRadius=60.0
        
        if (collectionView == cviewHouse){
            let cell2 = cviewHouse.dequeueReusableCell(withReuseIdentifier: "cellHouse", for: indexPath) as! MyCollectionViewCell
            cell2.imageViewHouse.image = UIImage(named: housesImages[indexPath.row])
            cell2.imageViewHouse.layer.cornerRadius=20.0
            return cell2
        }
        return cell
    }

    
}


//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellHouse", for: indexPath) as! MyCollectionViewCell
//
//        cell.imageViewHouse.image = UIImage(named: housesImages[indexPath.row])
//        cell.imageViewHouse.layer.cornerRadius=20.0
//
//
//
//        return cell
//    }
