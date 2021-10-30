//
//  Note+CoreDataProperties.swift
//  splokhmatikovPW4
//
//  Created by Сергей Лохматиков on 30.10.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var creationDate: Date
    @NSManaged public var descriptionString: String?
    @NSManaged public var title: String?

}

extension Note : Identifiable {

}
