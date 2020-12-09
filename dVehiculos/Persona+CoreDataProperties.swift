//
//  Persona+CoreDataProperties.swift
//  dVehiculos
//
//  Created by Aula11 on 9/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//
//

import Foundation
import CoreData


extension Persona {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persona> {
        return NSFetchRequest<Persona>(entityName: "Persona")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var email: String?
    @NSManaged public var imagen_perfil: NSData?
    @NSManaged public var experimentos: NSSet?
    @NSManaged public var password: String?

}

// MARK: Generated accessors for experimentos
extension Persona {

    @objc(addExperimentosObject:)
    @NSManaged public func addToExperimentos(_ value: Vehiculo)

    @objc(removeExperimentosObject:)
    @NSManaged public func removeFromExperimentos(_ value: Vehiculo)

    @objc(addExperimentos:)
    @NSManaged public func addToExperimentos(_ values: NSSet)

    @objc(removeExperimentos:)
    @NSManaged public func removeFromExperimentos(_ values: NSSet)

}
