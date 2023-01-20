//
//  CrearMusicaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 18/01/23.
//

import Foundation
import Alamofire

class CrearMusicaViewModel: ObservableObject{
    
    func crearProducto(postMusicasRequest: PostMusicasRequest) async throws -> PostMusicasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PostMusicasResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/musicas",
                method: .post,
                parameters: postMusicasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PostMusicasResponse.self) { (dataResponse: DataResponse<PostMusicasResponse, AFError>) in
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
