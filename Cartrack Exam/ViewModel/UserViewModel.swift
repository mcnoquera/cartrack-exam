//
//  UserViewModel.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

class UserViewModel: CTGenericViewModel<UserModel> {

    
    //MARK: - Property
    var idText: String {
        return "\(model.id)"
    }
    
    var nameText: String {
        return model.name.unwrappedValue
    }
    
    var userNameText: String {
        return model.username.unwrappedValue
    }
    
    var emailText: String {
        return model.email.unwrappedValue
    }
    
    var phoneText: String {
        return model.phone.unwrappedValue
    }
    
    var websiteText: String {
        return model.website.unwrappedValue
    }
    
    var streetText: String {
        return (model.address?.street.unwrappedValue).unwrappedValue
    }
    
    var suiteText: String {
        return (model.address?.suite.unwrappedValue).unwrappedValue
    }
    
    var cityText: String {
        return (model.address?.city.unwrappedValue).unwrappedValue
    }
    
    var zipCodeText: String {
        return (model.address?.zipcode.unwrappedValue).unwrappedValue
    }
    
    var geoLatValue: Double {
        return Double((model.address?.geo?.lat.unwrappedValue).unwrappedValue).unwrappedValue
    }
    
    var geoLongValue: Double {
        return Double((model.address?.geo?.long.unwrappedValue).unwrappedValue).unwrappedValue
    }
    
    var companyNameText: String {
        return (model.company?.name.unwrappedValue).unwrappedValue
    }
    
    var companyCatchPhraseText: String {
        return (model.company?.catchPhrase.unwrappedValue).unwrappedValue
    }
    
    var companyBs: String {
        return (model.company?.bs.unwrappedValue).unwrappedValue
    }
    
    //MARK: - Constructor
    override init() {
        super.init()
    }
    
    init(_ model: UserModel) {
        super.init()
        self.model =  model
    }
    
    //MARK: - Methods
    
    
}
