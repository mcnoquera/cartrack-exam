//
//  GeoModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/19/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import ObjectMapper
import UIKit


class GeoModel: NSObject, Mappable, NSCoding {
    
    //MARK: - Property
    var lat: String?
    var long: String?
  
    //MARK: - Constructor
    override public init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    //MARK: - Methods
    func mapping(map: Map) {
        lat     <- map["lat"]
        long    <- map["lng"]
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        self.init()
        let model = Mapper<GeoModel>().map(JSONObject: self.decodeObject(aDecoder))
        lat = model?.lat
        long = model?.long
    }

    public func encode(with aCoder: NSCoder) {
        self.encodeObject(aCoder, model: self.toJSON())
    }

}
