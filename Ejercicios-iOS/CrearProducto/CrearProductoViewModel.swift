//
//  CrearProductoViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 11/01/23.
//

import Foundation
import Alamofire

class CrearProductoViewModel: ObservableObject{
    
    func crearProducto(postProductosRequest: PostProductosRequest) async throws -> PostProductosResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PostProductosResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/productos",
                method: .post,
                parameters: postProductosRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PostProductosResponse.self) { (dataResponse: DataResponse<PostProductosResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let postProductosResponse):
                        continuation.resume(returning: postProductosResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
