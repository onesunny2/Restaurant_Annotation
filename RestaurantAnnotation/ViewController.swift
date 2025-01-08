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
    @IBOutlet var sheetButton: UIButton!
    
    let restaurants = RestaurantList()
    let maplocation = MapLocation(latitudeList: [], longitudeList: [])
    
    var filteringList: [Restaurant] = []
    var annotations: [MKPointAnnotation] = []
    
    let buttonName = ["전체", "분식", "양식", "카페", "한식", "샐러드", "일식", "중식"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let restaurant = restaurants.restaurantArray
        for index in 0...restaurants.restaurantArray.count - 1 {
            maplocation.latitudeList.append(restaurant[index].latitude)
            maplocation.longitudeList.append(restaurant[index].longitude)
        }
        
        for index in 0...buttonName.count - 1 {
            categoryButtons[index].setTitle(buttonName[index], for: .normal)
        }
        
        sheetButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        sheetButton.setTitle("", for: .normal)
        sheetButton.configuration = .filled()
        sheetButton.tintColor = .white
        sheetButton.configuration?.cornerStyle = .capsule
        sheetButton.configuration?.baseBackgroundColor = .black

        mapView.delegate = self
        
        configureMapView("전체")
    }
    
    func configureMapView(_ name: String) {
        
        filteringList = (name == "전체") ? restaurants.restaurantArray : restaurants.restaurantArray.filter { $0.category == name }
        
        print(filteringList)
        
        let center = CLLocationCoordinate2D(latitude: maplocation.latiAverage, longitude: maplocation.longiAverage)

        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 300, longitudinalMeters: 300)
        
        for index in 0...filteringList.count - 1 {
            let annotation = MKPointAnnotation()
            
            annotation.title = filteringList[index].name
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: filteringList[index].latitude, longitude: filteringList[index].longitude)
    
            annotations.append(annotation)
        }
    
        mapView.addAnnotations(annotations)
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        
        // 어노테이션 자체와 어노테이션을 추가해둔 배열을 비우지 않으면 제대로 refresh 되지 않음
        mapView.removeAnnotations(annotations)
        annotations.removeAll()
        
        guard let name = sender.currentTitle else { return }
        
        configureMapView(name)
    }
    
    @IBAction func tappedMenuBar(_ sender: UIButton) {
        
    }
}

/*
 1. 지역의 중심을 어디로 잡을 것인가 -> 더미 데이터에 있는 각 경도 위도들의 평균?
 
 
 */
