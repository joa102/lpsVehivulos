//
//  Vehiculo+CoreDataProperties.swift
//  dVehiculos
//
//  Created by Aula11 on 9/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//
//

import Foundation
import CoreData


extension Vehiculo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vehiculo> {
        return NSFetchRequest<Vehiculo>(entityName: "Vehiculo")
    }

    @NSManaged public var clase: String?
    @NSManaged public var compacidad: Int32
    @NSManaged public var circularidad: Int32
    @NSManaged public var distanciaCircularidad: Int32
    @NSManaged public var relacionRadio: Int32
    @NSManaged public var relacionAspectoEje: Int32
    @NSManaged public var aspectoLongitudMaxima: Int32
    @NSManaged public var elongacion: Int32
    @NSManaged public var fecha: Date?
    @NSManaged public var rectangularidadEje: Int32
    @NSManaged public var longitudMaximaRectangularidad: Int32
    @NSManaged public var variacionEscalonadaEjeMayor: Int32
    @NSManaged public var variacionescalonadaEjeMenor: Int32
    @NSManaged public var curtosisEjeMayor: Int32
    @NSManaged public var curtosisEjeMenor: Int32
    @NSManaged public var radioZonasVacias: Int32
    @NSManaged public var oblicuidadEjeMayor: Int32
    @NSManaged public var usuario: Persona?

}
