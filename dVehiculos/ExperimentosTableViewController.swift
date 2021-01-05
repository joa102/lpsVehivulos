//
//  ExperimentoTableViewController.swift
//  dVehiculos
//
//  Created by Juandi on 02/12/2020.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ExperimentoTableViewController: UITableViewController {
    
    // CONEXIONES
    @IBOutlet var tableViewExperimento: UITableView!
    
    // VARIABLES
    var experimentos: [NSManagedObject] = []
    var vehiculo:NSManagedObject!
    
    // CONTRUCTOR INICIAL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Historial"
    }
    
    //Enviar el vehiculo selecionado para ver en detalle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seleccionarExperimento"
        //if segue.destination is DetalleExperimentoTableViewController
        {
            if let indexPath = tableViewExperimento.indexPathForSelectedRow {
                
                let celdaSeleccionada = indexPath.row
                let vc = segue.destination as? DetalleExperimentoTableViewController
                vc?.vehiculoDetalle = self.experimentos[celdaSeleccionada]
            }
            
        }
    }
    
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Declaramos el appDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Seleccionamos el core data
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Vehiculo")
       
        // Cargamos los vehiculos
        do {
            experimentos = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Ha ocurrido un error  \(error), \(error.userInfo)")
        }
    }
    
    // Contador de filas en la tabla
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experimentos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cargamos vehiculo especifico
        let vehiculo = experimentos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExperimentoTableViewCell",
                                                 for: indexPath) as! ExperimentoTableViewCell
        
        // CARGAR DATOS
        let numExp:Int = indexPath.row + 1
        cell.labelExperimento.text = "Experimento \(numExp)"
        cell.labelNombre.text = vehiculo.value(forKeyPath: "clase") as? String
        
        // CARGAR FECHA
        let date:Date
        if(vehiculo.value(forKeyPath: "fecha") != nil) {
            date = vehiculo.value(forKeyPath: "fecha") as! Date
        } else {
            date = Date()
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        cell.labelFecha.text = dateFormatter.string(from: date)
            
        // CARGAR IMAGEN
        let imagenVehiculo = vehiculo.value(forKeyPath: "clase") as? String
        cell.imageExperimento.image = UIImage(named: imagenVehiculo!)
                       
        if(vehiculo.value(forKeyPath: "clase") as? String == "Opel Manta 400") {
            cell.imageExperimento.image = UIImage(named:"Opel2D")
        }
        if(vehiculo.value(forKeyPath: "clase") as? String == "Furgoneta") {
            cell.imageExperimento.image = UIImage(named:"furgoneta2D")
        }
        if(vehiculo.value(forKeyPath: "clase") as? String == "Saab 900") {
            cell.imageExperimento.image = UIImage(named:"Saab2D")
        }
        if(vehiculo.value(forKeyPath: "clase") as? String == "Autobus") {
            cell.imageExperimento.image = UIImage(named:"Autobus2D")
        }
            
        cell.accessoryType = .disclosureIndicator
            
        return cell
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vehiculo = experimentos[indexPath.row]
    }
    
    // ELIMINAR EXPERIMENTO
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {return}
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(experimentos[indexPath.row])
        experimentos.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        do {
            try managedContext.save()
            tableView.reloadData()
        } catch let error as NSError {
            print("No se pudo guardar. \(error), \(error.userInfo)")
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Borrar"
    }
    
    //Volver a historial
    @IBAction func segueUnwrapHistorial(_ send: UIStoryboardSegue){
    }
}

