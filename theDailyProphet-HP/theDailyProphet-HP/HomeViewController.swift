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
    var personImages:[String] = ["harry1", "harry3", "harry4"]
    var housesImages:[String] = ["lufalufa", "grifinoria", "corvinal", "son"]
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
        var cell = UICollectionViewCell()
        if (collectionView == cviewPerson) {
            if let cellPerson = cviewPerson.dequeueReusableCell(withReuseIdentifier: "cellPerson", for: indexPath) as? PersonViewCell {
                cellPerson.imageViewPerson.image = UIImage(named: personImages[indexPath.row])
                cellPerson.imageViewPerson.layer.cornerRadius = 60.0
                cell = cellPerson
            }
        
        } else if (collectionView == cviewHouse){
            if let cellHouse = cviewHouse.dequeueReusableCell(withReuseIdentifier: "cellHouse", for: indexPath) as? HouseViewCell {
                cellHouse.imageViewHouse.image = UIImage(named: housesImages[indexPath.row])
                cellHouse.imageViewHouse.layer.cornerRadius = 20.0
                cell = cellHouse
            }
        }
        return cell
    }
}
