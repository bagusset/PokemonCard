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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configureCard()
    }
    
    func configureCard(){
        
        nameLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        labelView.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 10)
        labelView.layer.backgroundColor = #colorLiteral(red: 0.009368138388, green: 0.4109570384, blue: 0.708060801, alpha: 1)
       
        cardView.layer.cornerRadius = 5
        cardView.layer.borderWidth = 1.0
        cardView.layer.borderColor = UIColor.clear.cgColor
        cardView.layer.masksToBounds = true
        cardView.layer.backgroundColor = #colorLiteral(red: 0.9988299012, green: 0.7981647849, blue: 0.008801766671, alpha: 1)
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        cardView.layer.shadowRadius = 3.0
        cardView.layer.shadowOpacity = 2.0
        cardView.layer.masksToBounds = false
        cardView.layer.shadowPath = UIBezierPath(roundedRect:cardView.bounds, cornerRadius:cardView.layer.cornerRadius).cgPath
    }
}

extension UIView {

   func roundCorners(corners:CACornerMask, radius: CGFloat) {
      self.layer.cornerRadius = radius
      self.layer.maskedCorners = corners
   }
}

