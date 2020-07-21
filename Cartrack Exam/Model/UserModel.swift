//
//  UserModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/18/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import ObjectMapper
import UIKit


class UserModel: NSObject, Mappable, NSCoding {
    
    //MARK: - Property
    var id: Int = 0
    var username: String?
    var password: String?
    var name: String?
    var email: String?
    var address: AddressModel?
    var phone: String?
    var website: String?
    var company: CompanyModel?

    
    //MARK: - Constructor
    init(_ id: Int, _ username: String, _ password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
    
    override public init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    //MARK: - Methods
    func mapping(map: Map) {
        id              <- map["id"]
        username        <- map["username"]
        name            <- map["name"]
        email           <- map["email"]
        address         <- map["address"]
        phone           <- map["phone"]
        website         <- map["website"]
        company         <- map["company"]
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        self.init()
        let model = Mapper<UserModel>().map(JSONObject: self.decodeObject(aDecoder))
        username = model?.username
        name = model?.name
        email = model?.email
        address = model?.address
        phone = model?.phone
        website = model?.website
        company = model?.company
    }

    public func encode(with aCoder: NSCoder) {
        self.encodeObject(aCoder, model: self.toJSON())
    }

}
