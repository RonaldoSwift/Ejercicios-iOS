//
//  CrearComidaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation
import Alamofire

class CrearComidaViewModel: ObservableObject{
    
    func crearComida(postComidasRequest: PostComidasRequest) async throws -> PostComidasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PostComidasResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/comidas",
                method: .post,
                parameters: postComidasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PostComidasResponse.self) { (dataResponse: DataResponse<PostComidasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    switch(dataResponse.result){
                    case .success(let postComidasResponse):
                        continuation.resume(returning: postComidasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
