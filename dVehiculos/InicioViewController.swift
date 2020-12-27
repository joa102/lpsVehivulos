//
//  InicioViewController.swift
//  dVehiculos
//
//  Created by Aula11 on 3/12/20.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit
import CoreData

class InicioViewController: UIViewController {

    

    @IBOutlet weak var ImagenUsuarioInicio: UIImageView!
    @IBOutlet weak var nombreUsuarioInicio: UILabel!
    @IBOutlet weak var correoUsuarioInicio: UILabel!
    
    let context = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    
    //IMPORTANTE, ESTA VARIABLE TIENE QUE ESTAR INICIADA EN LOGIN O REGISTRASE ANTES DE LLAMAR A ESTA VISTA.
    var usuarioLogeado: Persona? //Informacion del usuario que entra en la app
    //IMPORTANTE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if(usuarioLogeado == nil){
            nombreUsuarioInicio.text = "Error no se ha recibido nada"
        }else{
            nombreUsuarioInicio.text = usuarioLogeado?.nombre
            correoUsuarioInicio.text = usuarioLogeado?.email
            //Pasando de Data a UIImage
            ImagenUsuarioInicio.image = UIImage(data: usuarioLogeado?.imagen_perfil! as! Data)
        }
        
    }
    

    /*
    // MARK: - Navigation
     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwrapSegueNuevoExperimento(_ send: UIStoryboardSegue){
        
        
    }
    
}
