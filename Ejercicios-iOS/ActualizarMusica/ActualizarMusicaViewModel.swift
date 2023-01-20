//
//  ActualizarMusicaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/01/23.
//

import Foundation
import Alamofire

class ActualizarMusicaViewModel: ObservableObject{
    
    func actualizarProducto(putMusicasRequest: PutMusicasRequest) async throws -> PutMusicasResponse {
        
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PutMusicasResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/musicas/\(putMusicasRequest.id)",
                method: .put,
                parameters: putMusicasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PutMusicasResponse.self) { (dataResponse: DataResponse<PutMusicasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let putMusicasResponse):
                        continuation.resume(returning: putMusicasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
