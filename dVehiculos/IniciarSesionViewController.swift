//
//  IniciarSesionViewController.swift
//  dVehiculos
//
//  Created by Aula11 on 14/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit

class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var contrasenaUsuario: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var usuarios:[Persona]?
    var usuario:Persona?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwrapInformacion(_ send: UIStoryboardSegue){
        
        
    }
    @IBAction func iniciarSesion(_ sender: UIButton) {
        let nombre = nombreUsuario.text
        let contrasena = contrasenaUsuario.text
        var flag = false
        do{
            self.usuarios = try context.fetch(Persona.fetchRequest())
        }catch{}
        self.usuarios!.forEach { user in
            if(user.nombre == nombre){
                if(user.password == contrasena){
                    flag = true
                    usuario = user
                }
            }
        }
        if(flag){
            print("Success")
            performSegue(withIdentifier: "paginaInicio", sender: self)
        }
        else{
            print("Failed")
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paginaInicio"{
            let destino = segue.destination as! InicioViewController
            destino.usuarioLogeado = self.usuario
        }
    }
    
}
