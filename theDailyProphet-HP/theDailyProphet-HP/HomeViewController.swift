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
    var arrayCharacteres: [Character] = []
    var personImages:[String] = ["harry1", "harry3", "harry4"]
    var housesImages:[String] = ["lufalufa", "grifinoria", "corvinal", "son"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacter()
    }
    
    func loadCharacter() {
        APIService.getCharacteres(completion: {data,error,array in
            self.arrayCharacteres = array
            DispatchQueue.main.async {
                self.cviewPerson.reloadData()
            }
        })
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == cviewHouse){
            return housesImages.count
        }
        return arrayCharacteres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if (collectionView == cviewPerson) {
            if let cellPerson = cviewPerson.dequeueReusableCell(withReuseIdentifier: "cellPerson", for: indexPath) as? PersonViewCell {
                let charac = self.arrayCharacteres[indexPath.row]
                cellPerson.downloadImage(urlImage: charac.image)
                cellPerson.layer.cornerRadius = cellPerson.frame.size.height/2
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
