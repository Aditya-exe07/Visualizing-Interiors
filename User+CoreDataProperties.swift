//
//  User+CoreDataProperties.swift
//  Visualizing Interiors
//
//  Created by Aditya
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var mobileNo: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension User : Identifiable {

}
