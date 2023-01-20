//
//  EliminarMusicaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/01/23.
//

import Foundation
import Alamofire

class EliminarMusicaViewModel: ObservableObject{
    func eliminarMusica(deletMusicasRequest: DeleteMusicasRequest) async throws -> DeleteMusicasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<DeleteMusicasResponse, Never>) in
            AF.request(
                "http://192.168.0.112:3006/musicas/\(deletMusicasRequest.id)",
                method: .delete,
                parameters: deletMusicasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: DeleteMusicasResponse.self) { (dataResponse: DataResponse<DeleteMusicasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let deleteMusicasResponse):
                        continuation.resume(returning: deleteMusicasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
