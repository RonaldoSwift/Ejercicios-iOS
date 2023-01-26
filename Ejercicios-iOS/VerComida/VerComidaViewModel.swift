//
//  VerComidaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation
import Alamofire

class VerComidaViewModel: ObservableObject{
    func obtenerTodasLasComidas() async throws ->[GetComidasResponse]{
        await withUnsafeContinuation({ (continuation:UnsafeContinuation<[GetComidasResponse],Never>) in
            AF.request(
                "http://192.168.0.112:3006/comidas",
                method: .get
            )
            .responseDecodable(of:[GetComidasResponse].self){dataResponse in
                let status = dataResponse.response?.statusCode
                print("Status Code \(status)")
                switch(dataResponse.result){
                case .success(let getComidasResponse):
                    print(getComidasResponse)
                    continuation.resume(returning: getComidasResponse)
                    break
                case .failure(let aferror):
                    print(aferror)
                    break
                }
            }
        })
    }
    
    func eliminarMusica(deletComidasRequest: DeleteComidasRequest) async throws -> DeleteComidasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<DeleteComidasResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/comidas/\(deletComidasRequest.id)",
                method: .delete,
                parameters: deletComidasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: DeleteComidasResponse.self) { (dataResponse: DataResponse<DeleteComidasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let deleteComidasResponse):
                        continuation.resume(returning: deleteComidasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
