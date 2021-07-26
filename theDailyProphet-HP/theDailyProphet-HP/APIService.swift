//
//  APIService.swift
//  APIService
//
//  Created by Kell Lanes on 22/07/21.
//

import Foundation

struct Character: Codable {
    let name: String
    let house: String
    let dateOfBirth: String
    let patronus: String
    let image: String
}

class APIService {
    
    class func getCharacteres( completion: @escaping (Data?, Error?, [Character]) -> Void) {
        let url = URL (string: "https://hp-api.herokuapp.com/api/characters")!
                
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in

            if let validData = data {
                do {
                    let arrayCharacteres =  try JSONDecoder().decode([Character].self, from: validData)
                    completion(validData, error, arrayCharacteres)
                    
                } catch let error {
                    print("error: \(String(describing: error))")
                    completion(validData, error, [])
                }
                
            } else {
                completion(nil, error, [])
            }

        }
        task.resume()
    }
}
