//
//  Notes+CoreDataProperties.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/23.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var collect: Bool
    @NSManaged public var content: String
    @NSManaged public var date: Date
    @NSManaged public var id: UUID
    @NSManaged public var index: Int16
    @NSManaged public var name: String
    @NSManaged public var top: String

}

extension Notes : Identifiable {

}
