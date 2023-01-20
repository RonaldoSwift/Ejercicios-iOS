//
//  VerMusicasViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 16/01/23.
//

import Foundation
import Alamofire

class VerMusicasViewModel: ObservableObject{
    
    func obtenerTodasLasMusicas() async throws ->[GetMusicasResponse]{
        await withUnsafeContinuation({ (continuation:UnsafeContinuation<[GetMusicasResponse],Never>) in
            AF.request(
                "http://192.168.0.112:3006/musicas",
                method: .get
            )
            .responseDecodable(of:[GetMusicasResponse].self){dataResponse in
                let status = dataResponse.response?.statusCode
                print("Status Code \(status)")
                switch(dataResponse.result){
                case .success(let getMusicasResponse):
                    print(getMusicasResponse)
                    continuation.resume(returning: getMusicasResponse)
                    break
                case .failure(let aferror):
                    print(aferror)
                    break
                }
            }
        })
    }
    
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

















