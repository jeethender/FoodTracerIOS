//
//  Meal.swift
//  FoodTrackerios
//
//  Created by maisapride8 on 19/04/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class Meal: NSObject,NSCoding{
    
    //MARK: Properties
    
    var name : String
    var photo : UIImage?
    var rating : Int
    
    //MARK: Initialization
    
    init?(name : String, photo : UIImage?, rating : Int){
        
        //Initialze stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        //Initialization should fail if there is no name or if the rating is negative.
        
        if name.isEmpty || rating < 0{
            
            return nil
        }
    }
    
    //MRK: Archiving paths.
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    
    
    
    //MARK: Types.
    
    struct PropertyKey {
        
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeObjectForKey(PropertyKey.ratingKey)as! Int
        
        //Must call the designated initializer.
        self.init(name: name, photo: photo, rating: rating)
    }
}
