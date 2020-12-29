//
//  IniciarSesionViewController.swift
//  dVehiculos
//
//  Created by Aula11 on 14/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit

class IniciarSesionViewController: UIViewController {

    // CONEXIONES
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var contrasenaUsuario: UITextField!
    
    // VARIABLES
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var usuarios:[Persona]?
    var usuario:Persona?
    
    // CONSTRUCTOR INICIAL
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // INICIAR SESION
    @IBAction func iniciarSesion(_ sender: UIButton) {
        
        let nombre = nombreUsuario.text
        let contrasena = contrasenaUsuario.text
        var flag = false
        
        //Comprueba si los campos no estan vacios
        if(nombre != ""){
            do{
                self.usuarios = try context.fetch(Persona.fetchRequest())
            }catch{}
            
            //Comprobar si el usuario existe
            self.usuarios!.forEach { user in
                if(user.nombre == nombre){
                    if(user.password == contrasena){
                        flag = true
                        usuario = user
                    }
                }
            }
        }
        
        if(flag){
            
            print("Exito al iniciar sesion")
            performSegue(withIdentifier: "paginaInicio", sender: self)
            
        }else{
            
            print("Fallo al iniciar sesion")
            // Alerta fallo a la hora de registrarse
            let alert = UIAlertController(title: "No se pudo iniciar sesion", message: "Ha ocurrido un fallo, es posible que el usuario y/o contraseña no sean correctos. Vuelva a intentarlo.", preferredStyle: .alert)
            let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
            subview.layer.cornerRadius = 5
            subview.backgroundColor = UIColor(red: (247/255.0), green: (108/255.0), blue: (78/255.0), alpha: 1.0)
            self.present(alert, animated: true, completion: nil)
            
            let duracion = DispatchTime.now() + 5
            DispatchQueue.main.asyncAfter(deadline: duracion){
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    //Enviar datos de usuario a inicio
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paginaInicio"{
            let destino = segue.destination as! InicioViewController
            destino.usuarioLogeado = self.usuario
        }
    }
    
    //Control de informacion
    @IBAction func unwrapInformacion(_ send: UIStoryboardSegue){
    }
    
}
