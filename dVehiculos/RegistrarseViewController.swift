//
//  RegistrarseViewController.swift
//  dVehiculos
//
//  Created by Aula11 on 14/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit

class RegistrarseViewController: UIViewController {

    // CONEXIONES
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var emailUsuario: UITextField!
    @IBOutlet weak var contrasenaUsuario: UITextField!
    @IBOutlet weak var recontrasenaUsuario: UITextField!
    
    // VARIABLES
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // CONSTRUCTOR INICIAL
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // REGISTRARSE
    @IBAction func registrarse(_ sender: UIButton) {
        let nombre = nombreUsuario.text
        let email = emailUsuario.text
        let contrasena = contrasenaUsuario.text
        let recontrasena = recontrasenaUsuario.text
        
        //Comprueba si las contraseñas son las mismas
        if(contrasena == recontrasena){
            let newUsuario = Persona(context: self.context)
            
            newUsuario.nombre = nombre
            newUsuario.email = email
            newUsuario.password = contrasena
            newUsuario.imagen_perfil = (UIImage(named: "userImg")?.pngData()! as NSData?)
            
            do{
                try self.context.save()
                
                print("Exito al registrarse")
                // Alerta de registro existoso
                let alert = UIAlertController(title: "Registrado correctamente", message: "Ya puede iniciar sesión", preferredStyle: .alert)
                let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
                subview.layer.cornerRadius = 5
                subview.backgroundColor = UIColor(red: (53/255.0), green: (254/255.0), blue: (139/255.0), alpha: 1.0)
                self.present(alert, animated: true, completion: nil)
                
                let duracion = DispatchTime.now() + 5
                DispatchQueue.main.asyncAfter(deadline: duracion){
                    alert.dismiss(animated: true, completion: nil)
                }
                
                performSegue(withIdentifier: "iniciarSesion", sender: self)
            
            }catch{
                
                print("Fallo al registrarse")
                // Alerta fallo a la hora de registrarse
                let alert = UIAlertController(title: "No se pudo registrar", message: "Ha ocurrido un fallo, vuelva a intentarlo de nuevo", preferredStyle: .alert)
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
        else{
            
            print("Fallo de contraseñas")
            // Alerta de que las contraseñas no son iguales
            let alert = UIAlertController(title: "", message: "Verifica la contraseña, no son iguales.", preferredStyle: .alert)
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
}
