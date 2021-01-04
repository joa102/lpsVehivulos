//
//  DetalleExperimentoTableViewController.swift
//  dVehiculos
//
//  Created by Juandi on 03/12/2020.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit
import CoreData
//import Foundation

class DetalleExperimentoTableViewController: UIViewController {
    
    var vehiculoDetalle:NSManagedObject!
    
    @IBOutlet weak var vehiculoImagen: UIImageView!
    @IBOutlet weak var logoImagen: UIImageView!
    @IBOutlet weak var claseLabel: UILabel!
    @IBOutlet weak var compacidadLabel: UILabel!
    @IBOutlet weak var circularidadLabel: UILabel!
    @IBOutlet weak var elongacionLabel: UILabel!
    @IBOutlet weak var aspectLongMaxLabel: UILabel!
    @IBOutlet weak var rectEjeLabel: UILabel!
    @IBOutlet weak var distCircLabel: UILabel!
    @IBOutlet weak var longMaxLabel: UILabel!
    @IBOutlet weak var relAspectLabel: UILabel!
    @IBOutlet weak var relRadioLabel: UILabel!
    @IBOutlet weak var varEscMaxLabel: UILabel!
    @IBOutlet weak var varEscMinLabel: UILabel!
    @IBOutlet weak var oblicuidadMaxLabel: UILabel!
    @IBOutlet weak var radZonVacLabel: UILabel!
    @IBOutlet weak var curtosisMaxLabel: UILabel!
    @IBOutlet weak var curtosisMinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detalle"
        
        claseLabel?.text = vehiculoDetalle.value(forKeyPath: "clase") as? String
        compacidadLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "compacidad") as? Int ?? 0) "
        circularidadLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "circularidad") as? Int ?? 0) "
        elongacionLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "elongacion") as? Int ?? 0) "
        aspectLongMaxLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "aspectoLongitudMaxima") as! Int) "
        rectEjeLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "rectangularidadEje") as! Int) "
        distCircLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "distanciaCircularidad") as! Int) "
        longMaxLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "longitudMaximaRectangularidad") as! Int) "
        relAspectLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "relacionAspectoEje") as! Int) "
        relRadioLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "relacionRadio") as! Int) "
        varEscMaxLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "variacionEscalonadaEjeMayor") as! Int) "
        varEscMinLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "variacionescalonadaEjeMenor") as! Int) "
        oblicuidadMaxLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "oblicuidadEjeMayor") as! Int) "
        radZonVacLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "radioZonasVacias") as! Int) "
        curtosisMaxLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "curtosisEjeMayor") as! Int) "
        curtosisMinLabel?.text = "\(vehiculoDetalle.value(forKeyPath: "curtosisEjeMenor") as! Int) "
        
        if(self.claseLabel.text == "Opel Manta 400") {
            vehiculoImagen.image = UIImage(named:"Opel3D")
            logoImagen.image = UIImage(named:"logoOpel")
        }
        if(self.claseLabel.text == "Furgoneta") {
            vehiculoImagen.image = UIImage(named:"furgoneta3D")
            logoImagen.image = UIImage(named:"logoChevrolet")
        }
        if(self.claseLabel.text == "Saab 900") {
            vehiculoImagen.image = UIImage(named:"Saab3D")
            logoImagen.image = UIImage(named:"logoSaab")
        }
        if(self.claseLabel.text == "Autobus") {
            vehiculoImagen.image = UIImage(named:"Autobus3D")
            logoImagen.image = UIImage(named:"logoBus")
        }
    }
    
    @IBAction func informacionVehiculos(_ sender: Any) {
        var mensajeVehiculo = ""
        switch (self.claseLabel.text) {
        case "Opel Manta 400":
            mensajeVehiculo = "El Opel Manta 400 es un automóvil deportivo de tracción trasera fabricado por Opel como subsidiaria de General Motors (GM) desde 1970 hasta 1988. \nSe trata de un cupé deportivo derivado del Opel Ascona, con el cual se pensó competir contra el Ford Capri. Fue el sucesor del Opel GT de primera generación, tuvo tres generaciones y fue reemplazado por el Opel Calibra en 1988."
            break
        case "Saab 900":
            mensajeVehiculo = "El Saab 900 es un automóvil de tamaño medio que fue producido por Saab desde 1978 hasta 1998 en dos generaciones. La primera generación de 1978 a 1994 se conoce como la `clásica` y la generación de 1994 a 1998 se conoce como la `nueva generación`. \nEl Saab 900 `clásico` se basó en el chasis del Saab 99, aunque con una parte delantera más larga para cumplir con las normas de los EE.UU. sobre choques frontales. El 900 se fabricó en configuraciones de sedán de 2 y 4 puertas y de hatchback de 3 y 5 puertas y, a partir de 1986, como modelo cabriolet (convertible). Había carburadores de uno y dos centímetros, con inyección de combustible y turbocompresor, incluyendo tanto el Turbo de Presión Completa (FPT), como, en los modelos europeos de principios de los 90, Turbos de Baja Presión (LPT)."
            break
        case "Furgoneta":
            mensajeVehiculo = "La Chevrolet Van es una furgoneta realizada por General Motors para Chevrolet. El término `Chevrolet Van` también se refiere a toda la serie de camionetas vendidas por Chevrolet. \nLa primera camioneta fue lanzada en 1961 en la plataforma de Corvair, y la última camioneta Chevrolet en la producción es la Chevrolet Express. Fue fabricada entre 1964 y 1996."
            break
        case "Autobus":
            mensajeVehiculo = "Mientras que los autobuses de dos pisos para cubrir largas distancias están extendidos por todo el mundo, los usados para transporte público en ciudades son menos comunes. Son bastantes populares en algunas ciudades europeas y en algunas partes de Asia."
            break
        default:
            mensajeVehiculo = "No hay ninguna información. Todavia no se ha seleccionado ningun vehiculo"
            
        }
        //Creacion de la alerta
        let alerta = UIAlertController(title: self.claseLabel.text,
                                       message: mensajeVehiculo,
                                       preferredStyle: UIAlertController.Style.actionSheet)
        
        //Cerrar
        let cerrar = UIAlertAction(title :"Cerrar",
                                   style: UIAlertAction.Style.destructive) { _ in
                                    alerta.dismiss(animated: true, completion: nil)
        }
        alerta.addAction(cerrar)
        
        self.present(alerta, animated: false, completion: nil)
    }

}
