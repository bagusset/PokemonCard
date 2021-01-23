//
//  PokemonDisplayCardCell.swift
//  PokemonCard
//
//  Created by Bagus setiawan on 23/01/21.
//

import UIKit

class PokemonDisplayCardCell: UICollectionViewCell {
    
    var getData : DataModel?
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
}

