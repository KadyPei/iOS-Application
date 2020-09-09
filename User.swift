//
//  Uswer.swift
//  Eater
//
//  Created by Kady Pei on 12/12/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import Foundation
class User {
    
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
