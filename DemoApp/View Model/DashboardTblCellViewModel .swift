//
//  DashboardTblCellViewModel .swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 07/11/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
class DashboardTblCellViewModel {
    var id : Int
    var title : String
    var date : String
    var rating : String
    var imageUrl : URL?
    var overview : String
    
    init(movie : Movie)
    {
        self.overview = movie.overview ?? ""
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating =  "\(movie.voteAverage)/10"
        self.imageUrl = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode:String)->URL?
    {
        return URL(string: "\(NetworkConstant.shared.imageServerAddress) \(imageCode)")
    }
}
