//
//  Alarm+CoreDataProperties.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 21.10.2021.
//
//

import Foundation
import CoreData


extension Alarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alarm> {
        return NSFetchRequest<Alarm>(entityName: "Alarm")
    }

    @NSManaged public var isActive: Bool
    @NSManaged public var time: Int64

}

extension Alarm : Identifiable {

}
