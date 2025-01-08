//
//  ViewController.swift
//  RestaurantAnnotation
//
//  Created by Lee Wonsun on 1/8/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var categoryButtons: [UIButton]!
    @IBOutlet var mapView: MKMapView!
    
    let restaurants = RestaurantList()
    let maplocation = MapLocation(latitudeList: [], longitudeList: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...restaurants.restaurantArray.count - 1 {
            maplocation.latitudeList.append(restaurants.restaurantArray[index].latitude)
            maplocation.longitudeList.append(restaurants.restaurantArray[index].longitude)
        }

        mapView.delegate = self
        
        configureMapView()
        
    }
    
    func configureMapView() {
        
        let center = CLLocationCoordinate2D(latitude: maplocation.latiAverage, longitude: maplocation.longiAverage)

        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 300, longitudinalMeters: 300)

        var annotations: [MKPointAnnotation] = []
        
        for index in 0...restaurants.restaurantArray.count - 1 {
            let annotation = MKPointAnnotation()
            
            annotation.title = restaurants.restaurantArray[index].name
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurants.restaurantArray[index].latitude, longitude: restaurants.restaurantArray[index].longitude)
    
            annotations.append(annotation)
        }
    
        mapView.addAnnotations(annotations)
    }

}

/*
 1. 지역의 중심을 어디로 잡을 것인가 -> 더미 데이터에 있는 각 경도 위도들의 평균?
 
 
 */
