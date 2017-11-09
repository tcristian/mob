//
//  Movie.swift
//  mdb
//
//  Created by Timar Cristian on 02/11/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit

class Movie{
    var title: String
    var poster: String
    var year: Int
    var desc: String
    var type: String
    
    init?(title: String, poster: String, year: Int, desc: String, type: String){
        if title.isEmpty || year < 0 || type.isEmpty {
            return nil
        }
        self.title = title
        self.poster = poster
        self.year = year
        self.desc = desc
        self.type = type
    }
}


