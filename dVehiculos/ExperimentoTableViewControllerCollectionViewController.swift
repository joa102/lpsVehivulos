//
//  ExperimentoTableViewController.swift
//  dVehiculos
//
//  Created by Juandi on 02/12/2020.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit
import CoreData

class ExperimentoTableViewController: UITableViewController {
    
    @IBOutlet var tableViewExperimento: UITableView!
    var experimentos: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Historial"
        /*tableViewExperimento.register(UITableViewCell.self,
         forCellReuseIdentifier: "ExperimentoCell")*/
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "seleccionarExperimento" {
     if let indexPath = tableView.indexPathForSelectedRow {
     let sRow = indexPath.row
     let tableExperimento = segue.destination as! DetalleExperimentoTableViewController
     tablePiloto.escuderia = self.escuderias[sRow]
     }
     }
     }*/
    
    // MARK: - Table view data source
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }*/
    
    @IBAction func addExperimento(_ sender: Any) {
        let alert = UIAlertController(title: "Nuevo Expeimento",
                                      message: "Introduce un nuev expeimento",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.save(name: nameToSave)
            self.tableViewExperimento.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(name: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Vehiculo",
                                       in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        person.setValue(name, forKeyPath: "clase")
        
        // 4
        do {
            try managedContext.save()
            experimentos.append(person)
        } catch let error as NSError {
            print("No se pudo guardar. \(error), \(error.userInfo)")
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
            
            let person = experimentos[indexPath.row]
            let cell =
                tableView.dequeueReusableCell(withIdentifier: "ExperimentoTableViewCell",
                                              for: indexPath) as! ExperimentoTableViewCell
            /*cell.textLabel?.text =
             person.value(forKeyPath: "nombre") as? String*/
            cell.labelExperimento.text = person.value(forKeyPath: "clase") as? String
            cell.labelNombre.text = person.value(forKeyPath: "clase") as? String
            cell.labelFecha.text = person.value(forKeyPath: "clase") as? String
            cell.imageExperimento.image = UIImage(named:"opel1")
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
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
    
}

