//
//  VerProductosViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 11/01/23.
//

import Foundation
import Alamofire

class VerProductosViewModel : ObservableObject{
    func obtenerTodosLosProductos() async throws ->[GetProductosResponse]{
        await withUnsafeContinuation({ (continuation:UnsafeContinuation<[GetProductosResponse],Never>) in
            AF.request(
                "http://192.168.0.112:3006/productos",
                method: .get
            )
                .responseDecodable(of:[GetProductosResponse].self){dataResponse in
                    let status = dataResponse.response?.statusCode
                    print("Status Code \(status)")
                    switch(dataResponse.result){
                    case .success(let getProductosResponse):
                        print(getProductosResponse)
                        continuation.resume(returning: getProductosResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
