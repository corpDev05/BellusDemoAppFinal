//
//  NetworkConstant.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 31/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation

class NetworkConstant {
    public static var shared : NetworkConstant = NetworkConstant()
    
    private init () {
        //This to make the class singletone as no other classes will be able to use it
    }
    
    public var apiKey : String {
        get {
            return "391e05edfb64e844bb9c38d65794ce56"
        }
    }
    public var serverAddress : String {
        get {
             return "https://api.themoviedb.org/3/"
        }
    }
    public var imageServerAddress : String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
    public var  searchBaseUrl : String {
        get{
            return "https://api-dev-scus-demo.azurewebsites.net/api/"
        }
    }
    public var smarthPhonePath : String {
        get{
            return  "Product/GetSmartPhone"
        }
    }
}
