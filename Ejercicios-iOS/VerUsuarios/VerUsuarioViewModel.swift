//
//  VerUsuarioViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 6/01/23.
//

import Foundation
import Alamofire

class VerUsuarioViewModel : ObservableObject{
    
    
    // Metodo para el web service
    
    func obtenerTodosLosUsuarios() async throws -> [GetUsuariosResponse]{
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<[GetUsuariosResponse], Never>) in
            AF.request("http://192.168.0.112:5001/Usuarios/Usuarios")
                .responseDecodable(of: [GetUsuariosResponse].self){ dataResponse in
                    let status = dataResponse.response?.statusCode
                    print("Status Code \(status)")
                    
                    switch(dataResponse.result){
                    case .success(let getUsuariosResponse):
                        print(getUsuariosResponse)
                        continuation.resume(returning: getUsuariosResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
