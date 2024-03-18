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
open class APICaller {
    
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
    
    static func searchProduct(_ name : String , _ color : String , completionHandler : @escaping(_ result: Result<SearchResponseResultModel,NetworkError>)->Void){
        
        if name == "" && color == ""{
            return
        }
        
        let urlString = NetworkConstant.shared.searchBaseUrl + NetworkConstant.shared.smarthPhonePath + "?name=\(name)&color=\(color)"
        guard let url = URL(string: urlString) else
        {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil, let data = dataResponse,
               let resultData = try? JSONDecoder().decode(SearchResponseResultModel.self, from: data){
                completionHandler(.success(resultData))
                
            }
            else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
    
    static func getFakeResponse(completionHandler: @escaping(_ result:Result<FakeStoreResponse,NetworkError>) -> Void){
        
        let url = URL(string: "https://fakestoreapi.com/products")
        guard let reqURL = url else {
            completionHandler(.failure(NetworkError.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: reqURL) { dataResponse, urlResponse, error in
            guard let data = dataResponse else{
                completionHandler(.failure(.canNotParseData))
                return
            }
            
            let  result = try? JSONDecoder().decode(FakeStoreResponse.self, from: data)
            completionHandler(.success(result!))
        }.resume()
        
    }
    
    static func getSearchData(_ parameter:String ,completionHandler: @escaping(_ result:Result<FakeStoreResponse,NetworkError>)->Void){
        
        debugPrint("Inside the Api Caller")
        
        let urlString = "https://fakestoreapi.com/products/category/" + parameter
        debugPrint("The url is \(urlString)")
        let url = URL(string: urlString)
        guard let url = url else{
            debugPrint("Url Error")
            completionHandler(.failure(.urlError))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "get"
        
        URLSession.shared.dataTask(with: urlRequest) { responseData, networkResponse, error in
            
            if error == nil,let data = responseData,
               let result = try? JSONDecoder().decode(FakeStoreResponse.self, from: data)
            {
                //debugPrint("Api Success data is \(result)")
                completionHandler(.success(result))
            }
            else{
                debugPrint("Api call failed")
                completionHandler(.failure(.canNotParseData))
                
            }
            
        }.resume()
        
        
    }
    //Function for using POST request using URLSession with URLRequest
    /*func registerUser(){
        
        var urlRequest = URLRequest(url: URL(string: "EndpointForRegisteringUser")!)
        urlRequest.httpMethod = "post"
        //Creating data to be sent , you can modifiy it accordingly to your needs.
        let dataDictionary = ["name":"Devesh Pandey","email":"pdevesh669@gmail.com","password":"1234"]
        
        do {
            let requestBody =  try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest){( data,httpResponse,error) in
            if(data != nil && data?.count != 0)
            {
                let response = String(data:data!,encoding:.utf8)
                debugPrint(response!)
            }
            
        }.resume()
    } */
}
