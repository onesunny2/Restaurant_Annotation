//
//  MapLocation.swift
//  RestaurantAnnotation
//
//  Created by Lee Wonsun on 1/8/25.
//

import Foundation
import MapKit


// 이 객체가 하려는 역할이 정확히 무엇인가? -> 확실한 역할이 있다면 restaurant를 한쪽에서만 사용해도 되지 않을까?
class MapLocation {
    
    let restaurants = RestaurantList()
    
    var latiAverage: Double = 0.0
    var longiAverage: Double = 0.0
    
    var filteringList: [Restaurant] = []
    var annotations: [MKPointAnnotation] = []
    
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

enum FoodCategory {
    case all, bunsic, italy, cafe, korean, salad, japan, china
}

extension FoodCategory {
    
    var name: String {
        switch self {
        case .all:
            return "전체"
        case .bunsic:
            return "분식"
        case .italy:
            return "양식"
        case .cafe:
            return "카페"
        case .korean:
            return "한식"
        case .salad:
            return "샐러드"
        case .japan:
            return "일식"
        case .china:
            return "중식"
        }
    }
}
