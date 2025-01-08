//
//  MapLocation.swift
//  RestaurantAnnotation
//
//  Created by Lee Wonsun on 1/8/25.
//

import Foundation

class MapLocation {
    
    let restaurants = RestaurantList()
    
    var latiAverage: Double = 0.0
    var longiAverage: Double = 0.0
    
    var latitudeList: [Double] {
        didSet {
            latiAverage = latitudeList.reduce(0, +) / Double(restaurants.restaurantArray.count)
        }
    }
    var longitudeList: [Double] {
        didSet {
            longiAverage = longitudeList.reduce(0, +) / Double(restaurants.restaurantArray.count)
        }
    }
 
    init(latitudeList: [Double], longitudeList: [Double]) {
        self.latitudeList = latitudeList
        self.longitudeList = longitudeList
    }
}
