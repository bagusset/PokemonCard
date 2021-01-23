//
//  DataModel.swift
//  PokemonCard
//
//  Created by Bagus setiawan on 23/01/21.
//

import UIKit

class DataModel {
    
    var id : Int?
    var name : String?
    var image : UIImage?
    var imageUrl : String?
    var type : String?
    var weight : Int?
    var attack : Int?
    var defense : Int?
    var description : String?
    
    init(id : Int, dictionary: [String : AnyObject]) {
        self.id = id
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let imageUrl = dictionary["imageUrl"] as?  String {
            self.imageUrl = imageUrl
        }
        
        if let type = dictionary["type"] as? String {
            self.type = type
        }
        
        if let weight = dictionary["weight"] as? Int {
            self.weight = weight
        }
        
        if let attack = dictionary["attack"] as? Int {
            self.attack = attack
        }
        
        if let defense = dictionary["defense"] as? Int{
            self.defense = defense
        }
        
        if let description = dictionary["description"] as? String{
            self.description = description
        }
    }
    
}
