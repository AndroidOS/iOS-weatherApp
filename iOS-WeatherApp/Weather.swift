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

//struct Clouds{
//    varint all;
//}
//
//struct Sys{
//    varint type;
//    varint id;
//    varString country;
//    varint sunrise;
//    varint sunset;
//}
//
//struct Root{
//    varCoord coord;
//    varList<Weather> weather;
//    varString base;
//    varMain main;
//    varint visibility;
//    varWind wind;
//    varClouds clouds;
//    varint dt;
//    varSys sys;
//    varint timezone;
//    varint id;
//    varString name;
//    varint cod;
//}


