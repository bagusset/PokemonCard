//
//  ApiServices.swift
//  PokemonCard
//
//  Created by Bagus setiawan on 23/01/21.
//

import UIKit

class ApiServices{
    
    static let shared = ApiServices()
    let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    

    func fecthDataPokemon(completion: @escaping ([DataModel]) -> ()) {
        var pokemonDataArray = [DataModel]()
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed fecth data \(error.localizedDescription)")
            }
            
            guard let data = data else {return}
            
            do {
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else {return}
                
                for (key, result) in resultArray.enumerated() {
                    if let dictionary = result as? [String : AnyObject] {
                        let pokemon = DataModel(id: key, dictionary: dictionary)
                        
                        guard let imageUrl = pokemon.imageUrl else {return}
                        
                        self.fecthDataImage(withUrlString: imageUrl, completion: { (image) in
                            pokemon.image = image
                            pokemonDataArray.append(pokemon)
                            
                            pokemonDataArray.sort(by: {(poke1, poke2) -> Bool in
                                return poke1.id! < poke2.id!
                            })
                            completion(pokemonDataArray)
                        })
                    }
                }
               
            } catch let error{
                print("Failed to create json", error.localizedDescription)
            }
        }.resume()
    }
    
    private func fecthDataImage(withUrlString urlString : String, completion : @escaping(UIImage) -> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to fecth image data")
                return
            }
            
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            completion(image)
            
        } .resume()
    }
    
}
