//
//  AddressModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/19/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import ObjectMapper
import UIKit


class AddressModel: NSObject, Mappable, NSCoding {
    
    //MARK: - Property
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: GeoModel?
    
    //MARK: - Constructor
    override public init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    //MARK: - Methods
    func mapping(map: Map) {
        street          <- map["street"]
        suite           <- map["suite"]
        city            <- map["city"]
        zipcode         <- map["zipcode"]
        geo             <- map["geo"]
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        self.init()
        let model = Mapper<AddressModel>().map(JSONObject: self.decodeObject(aDecoder))
        street = model?.street
        suite = model?.suite
        city = model?.city
        zipcode = model?.zipcode
        geo = model?.geo
    }

    public func encode(with aCoder: NSCoder) {
        self.encodeObject(aCoder, model: self.toJSON())
    }

}
