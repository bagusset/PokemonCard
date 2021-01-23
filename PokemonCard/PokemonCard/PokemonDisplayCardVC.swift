//
//  ViewController.swift
//  PokemonCard
//
//  Created by Bagus setiawan on 23/01/21.
//

import UIKit

class PokemonDisplayCardVC: UIViewController {
    
    var getData = [DataModel]()
    
    @IBOutlet weak var pokemonCardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(fectdata())
        pokemonCardCollectionView.delegate = self
        pokemonCardCollectionView.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    
    func fectdata(){
        ApiServices.shared.fecthDataPokemon { (pokemon) in
            DispatchQueue.main.async {
                self.getData = pokemon
                self.pokemonCardCollectionView.reloadData()
            }
        }
    }


}

extension PokemonDisplayCardVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PokemonDisplayCardCell
        
        cell!.nameLabel.text = getData[indexPath.row].name
        cell!.imageView.image = getData[indexPath.row].image
        
        return cell!
    }
    
    
}
