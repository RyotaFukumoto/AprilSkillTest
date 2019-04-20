//
//  RestaurantGenreData.swift
//  AprilSkillTest
//
//  Created by ryota on 2019/04/20.
//  Copyright © 2019 ryota. All rights reserved.
//

import UIKit
import RealmSwift

class RestaurantGenreData: Object {
    @objc dynamic var code = ""
    @objc dynamic var name = ""

    override static func primaryKey() -> String? {
        return "code"
    }
}

