//
//  WelcomeViewController.swift
//  WelcomeViewController
//
//  Created by Kell Lanes on 22/07/21.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController {

    @IBOutlet weak var charactersTableView: UITableView!
    var arrayCharacteres: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.charactersTableView.register(UINib(nibName: "cellCharacters", bundle: nil), forCellReuseIdentifier: "IdCell")
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        loadCharacter()
    }
    
    func loadCharacter() {
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
            cell.downloadImage(urlImage: charac.image)
            return cell
        }
        return UITableViewCell()
    }
    
}
