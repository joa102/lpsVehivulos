//
//  RegistrarseViewController.swift
//  dVehiculos
//
//  Created by Aula11 on 14/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit

class RegistrarseViewController: UIViewController {

    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var emailUsuario: UITextField!
    @IBOutlet weak var contrasenaUsuario: UITextField!
    @IBOutlet weak var recontrasenaUsuario: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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

    
    @IBAction func unwrapInformacion_Registrarse(_ send: UIStoryboardSegue){
        
        
    }
    @IBAction func registrarse(_ sender: UIButton) {
        let nombre = nombreUsuario.text
        let email = emailUsuario.text
        let contrasena = contrasenaUsuario.text
        let recontrasena = recontrasenaUsuario.text
        if(contrasena == recontrasena){
            let newUsuario = Persona(context: self.context)
            newUsuario.nombre = nombre
            newUsuario.email = email
            newUsuario.password = contrasena
            newUsuario.imagen_perfil = (UIImage(named: "userImg")?.pngData()! as! NSData)
            do{
                try self.context.save()
                print("registro exitoso")
                performSegue(withIdentifier: "iniciarSesion", sender: self)
            }catch{
                print("Error registro")
            }
        }
        else{
            print("Contraseñas no iguales")
        }
    }
}
