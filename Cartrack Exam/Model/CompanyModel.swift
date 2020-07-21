//
//  CompanyModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/19/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import ObjectMapper
import UIKit

class CompanyModel: NSObject, Mappable, NSCoding {
    
    //MARK: - Property
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    //MARK: - Constructor
    override public init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    //MARK: - Methods
    func mapping(map: Map) {
        name          <- map["name"]
        catchPhrase   <- map["catchPhrase"]
        bs            <- map["bs"]
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        self.init()
        let model = Mapper<CompanyModel>().map(JSONObject: self.decodeObject(aDecoder))
        name = model?.name
        catchPhrase = model?.catchPhrase
        bs = model?.bs
    }

    public func encode(with aCoder: NSCoder) {
        self.encodeObject(aCoder, model: self.toJSON())
    }

}
