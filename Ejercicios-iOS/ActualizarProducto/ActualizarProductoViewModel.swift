//
//  ActualizarProductoViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 12/01/23.
//

import Foundation
import Alamofire

class ActualizarProductoViewModel: ObservableObject{
    
    func actualizarProducto(putProductosRequest: PutProductosRequest) async throws -> PutProductosResponse {
        
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PutProductosResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/productos/\(putProductosRequest.id)",
                method: .put,
                parameters: putProductosRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PutProductosResponse.self) { (dataResponse: DataResponse<PutProductosResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let putProductosResponse):
                        continuation.resume(returning: putProductosResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
            
        })
    }
    
}
