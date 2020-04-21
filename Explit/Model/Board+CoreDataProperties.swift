//
//  Board+CoreDataProperties.swift
//  Explit
//
//  Created by Maulana on 16/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//
//

import Foundation
import CoreData


extension Board {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Board> {
        return NSFetchRequest<Board>(entityName: "Board")
    }

    @NSManaged public var mission: String?
    @NSManaged public var notes: NSObject?

}
