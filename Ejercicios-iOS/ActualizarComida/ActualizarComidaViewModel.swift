//
//  ActualizarComidaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation
import Alamofire

class ActualizarComidaViewModel: ObservableObject{
    
    func actualizarComida(putComidasRequest: PutComidasRequest) async throws -> PutComidasResponse {
        
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PutComidasResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/comidas/\(putComidasRequest.id)",
                method: .put,
                parameters: putComidasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PutComidasResponse.self) { (dataResponse: DataResponse<PutComidasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let putComidasResponse):
                        continuation.resume(returning: putComidasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
