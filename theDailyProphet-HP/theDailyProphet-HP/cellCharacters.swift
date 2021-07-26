//
//  cellCharacters.swift
//  cellCharacters
//
//  Created by Kell Lanes on 23/07/21.
//

import UIKit

class cellCharacters: UITableViewCell {

    @IBOutlet weak var labelPatronus: UILabel!
    @IBOutlet weak var labelHouse: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func downloadImage(urlImage:String) {
        if let url = URL(string: urlImage) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.characterImageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
}
