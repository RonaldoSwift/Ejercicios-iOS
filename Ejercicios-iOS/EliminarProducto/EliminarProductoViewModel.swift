//
//  EliminarProductoViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 13/01/23.
//

import Foundation
import Alamofire

class EliminarProductoViewModel: ObservableObject{
    
    func eliminarProducto(deletProductosRequest: DeleteProductoRequest) async throws -> DeleteProductoResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<DeleteProductoResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/productos/\(deletProductosRequest.id)",
                method: .delete,
                parameters: deletProductosRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: DeleteProductoResponse.self) { (dataResponse: DataResponse<DeleteProductoResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let deleteProductosResponse):
                        continuation.resume(returning: deleteProductosResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
