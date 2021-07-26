//
//  WelcomeViewController.swift
//  WelcomeViewController
//
//  Created by Kell Lanes on 22/07/21.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController {
//    var personImages:[String] = ["lufalufa", "grifinoria", "corvinal", "sonserina"]

    @IBOutlet weak var charactersTableView: UITableView!
    var arrayCharacteres: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.charactersTableView.register(UINib(nibName: "cellCharacters", bundle: nil), forCellReuseIdentifier: "IdCell")
        
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        
        APIService.getCharacteres(completion: {data,error,array in
            self.arrayCharacteres = array
            DispatchQueue.main.async {
                self.charactersTableView.reloadData()
            }
        })
    }
    

}

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCharacteres.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = charactersTableView.dequeueReusableCell(withIdentifier: "IdCell", for: indexPath) as? cellCharacters {
            let charac = self.arrayCharacteres[indexPath.row]
            cell.labelName.text = charac.name
            cell.labelAge.text = charac.dateOfBirth
            cell.labelHouse.text = charac.house
            cell.labelPatronus.text = charac.patronus
          
            if let url = URL(string: charac.image) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }

                    DispatchQueue.main.async {
                        cell.characterImageView.image = UIImage(data: data)
                    }
                }

                task.resume()
            }
            return cell
        }
            
        return UITableViewCell()
        }

}
