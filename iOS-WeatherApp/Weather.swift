//
//  Weather.swift
//  iOS-WeatherApp
//
//  Created by Manuel Carvalho on 5/9/21.
//

import Foundation

struct Coord{
    var lon = 0.0
    var lat = 0.0
}

struct Weather{
    var id = 0
    var main = ""
    var description = ""
    var            icon = ""
}

struct Main{
    var temp = 0.0
    var feels_like = 0.0
    var temp_min = 0.0
    var temp_max = 0.0
    var pressure = 0
    var humidity = 0
}

struct Wind{
    var speed = 0.0
    var deg = 0
    var gust = 0.0
}

struct Clouds{
    var all: Int
}

struct Sys{
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct Root{
    var coord: Coord
//    var List<Weather> weather;
//    var String base;
//    var Main main;
//    var int visibility;
//    var Wind wind;
//    var Clouds clouds;
//    var int dt;
//    var Sys sys;
//    var int timezone;
//    var id:Int
//    var name:String
//    var cod:Int
}


