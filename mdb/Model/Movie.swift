//
//  Movie.swift
//  mdb
//
//  Created by Timar Cristian on 02/11/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit
import Foundation
class Movie:  NSObject, NSCoding{
    struct Keys {
        static let Title = "title"
        static let Poster = "poster"
        static let Year = "year"
        static let Desc = "desc"
        static let Types = "type"
    }

    
    private var title =  ""
    private var poster = ""
    private var year = ""
    private var desc = ""
    private var type = ""
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Keys.Title)
        aCoder.encode(poster, forKey:Keys.Poster)
        aCoder.encode(year, forKey:Keys.Year)
        aCoder.encode(desc, forKey:Keys.Desc)
        aCoder.encode(type, forKey: Keys.Types)
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let titleObj = aDecoder.decodeObject(forKey: Keys.Title) as? String {
            title = titleObj
        }
        if let posterObj = aDecoder.decodeObject(forKey: Keys.Poster) as? String {
            poster = posterObj
        }
        if let descObj = aDecoder.decodeObject(forKey: Keys.Desc) as? String {
            desc = descObj
        }
        if let typeObj = aDecoder.decodeObject(forKey: Keys.Types) as? String {
            type = typeObj
        }
        if let yearObj = aDecoder.decodeObject(forKey: Keys.Year) as? String {
            year = yearObj
        }
    }
    var Title: String {
        get {
            return title
        } set {
            title = newValue
        }
    }
    var Year: String{
        get{
            return year
        }set{
            year = newValue
        }
    }
    var Desc: String{
        get{
            return desc
        }set{
            desc = newValue
        }
    }
    var Poster: String{
        get{
            return poster
        }set{
            poster = newValue
        }
    }
    var Tip: String{
        get{
            return type
        }set{
            type = newValue
        }
    }
    
    init?(title: String, poster: String, year: String, desc: String, type: String){
        if title.isEmpty || type.isEmpty {
            return nil
        }
        self.title = title
        self.poster = poster
        self.year = year
        self.desc = desc
        self.type = type
    }

}


