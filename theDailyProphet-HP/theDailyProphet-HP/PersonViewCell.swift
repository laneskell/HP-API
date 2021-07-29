//
//  PersonViewCell.swift
//  PersonViewCell
//
//  Created by Kell Lanes on 26/07/21.
//

import UIKit

class PersonViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewPerson: UIImageView!

    
    func downloadImage(urlImage:String) {
        if let url = URL(string: urlImage) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.imageViewPerson.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
}
