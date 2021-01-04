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
    
    @IBOutlet var tableViewExperimento: UITableView!
    var experimentos: [NSManagedObject] = []
    var vehiculo:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Historial"
    }
    
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
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Vehiculo")
        //3
        do {
            experimentos = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Ha ocurrido un error  \(error), \(error.userInfo)")
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return experimentos.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let vehiculo = experimentos[indexPath.row]
            let cell =
                tableView.dequeueReusableCell(withIdentifier: "ExperimentoTableViewCell",
                                              for: indexPath) as! ExperimentoTableViewCell
        
            cell.labelExperimento.text = "Experimento \(experimentos.count)"
        
            cell.labelNombre.text = vehiculo.value(forKeyPath: "clase") as? String
        
            //FECHA
            if(vehiculo.value(forKeyPath: "fecha") != nil) {
                let date:Date = vehiculo.value(forKeyPath: "fecha") as! Date
                
                // Create Date Formatter
                let dateFormatter = DateFormatter()
                
                // Set Date Format
                dateFormatter.dateFormat = "dd/MM/YY"
                
                // Convert Date to String
                cell.labelFecha.text = dateFormatter.string(from: date)
            } else {
                let date:Date = Date()
            }
            
            //IMAGEN
            let imagenVehiculo = vehiculo.value(forKeyPath: "clase") as? String
            cell.imageExperimento.image = UIImage(named: imagenVehiculo!)
                       
            if(vehiculo.value(forKeyPath: "clase") as? String == "Opel Manta 400") {
                cell.imageExperimento.image = UIImage(named:"Opel3D")
            }
            if(vehiculo.value(forKeyPath: "clase") as? String == "Furgoneta") {
                cell.imageExperimento.image = UIImage(named:"furgoneta3D")
            }
            if(vehiculo.value(forKeyPath: "clase") as? String == "Saab 900") {
                cell.imageExperimento.image = UIImage(named:"Saab3D")
            }
            if(vehiculo.value(forKeyPath: "clase") as? String == "Autobus") {
                cell.imageExperimento.image = UIImage(named:"Autobus3D")
            }
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        vehiculo = experimentos[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {return}
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        // 2
        managedContext.delete(experimentos[indexPath.row])
        // 3
        experimentos.remove(at: indexPath.row)
        // 4
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
    
    @IBAction func segueUnwrapHistorial(_ send: UIStoryboardSegue){
        
    }
}

