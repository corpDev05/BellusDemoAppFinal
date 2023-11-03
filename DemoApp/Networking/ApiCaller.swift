//
//  ApiCaller.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 31/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
enum NetworkError : Error {
    case urlError
    case canNotParseData
}
public class APICaller {
    
    static func getTrendingMovies(completionHandler : @escaping(_ result: Result<APIResultModel,NetworkError>) -> Void){
        if NetworkConstant.shared.apiKey.isEmpty {
                   print("<!> API KEY is Missing <!>")
                   print("<!> Get One from: https://www.themoviedb.org/ <!>")
                   return
               }
               
               let urlString = NetworkConstant.shared.serverAddress +
                       "trending/all/day?api_key=" +
                       NetworkConstant.shared.apiKey
                       
               guard let url = URL(string: urlString) else {
                completionHandler(Result.failure(.urlError))
                   return
               }
               
               URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
                   if err == nil,
                      let data = dataResponse,
                      let resultData = try? JSONDecoder().decode(APIResultModel.self, from: data) {
                       completionHandler(.success(resultData))
                   } else {
                       print(err.debugDescription)
                       completionHandler(.failure(.canNotParseData))
                   }
               }.resume()
    }
}
