//
//  RestaurantSearchScreenViewController.swift
//  AprilSkillTest
//
//  Created by ryota on 2019/04/20.
//  Copyright © 2019 ryota. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RestaurantSearchScreenViewController: UIViewController,MKMapViewDelegate {
/// ジャンルバー
    @IBOutlet weak var restaurantGenreBar: UIView!
/// Map
    @IBOutlet weak var restaurantMapView: MKMapView!
    
    @IBOutlet weak var positionResetBtn: UIButton!
    
    var locationmanager:CLLocationManager!
    var center : CLLocationCoordinate2D!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
/// セットアップ
    func setUp() {
        locationmanager = CLLocationManager()
        self.setUpMap()
        self.setUpProtocol()
        NetWorkManger.restaurantGenreGetAPI()

    }
    
/// マップのセットアップ
    func setUpMap() {
        locationmanager.requestWhenInUseAuthorization()
        center = CLLocationCoordinate2DMake(locationmanager.location!.coordinate.latitude, locationmanager.location!.coordinate.longitude)
        restaurantMapView.centerCoordinate = center
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: restaurantMapView.centerCoordinate, span: span)
        restaurantMapView.region = region
        
        let myCircle: MKCircle = MKCircle(center: center, radius: CLLocationDistance(1000))
        
        restaurantMapView.addOverlay(myCircle)
    }

/// プロトコルのセットアップ
    func setUpProtocol() {
        restaurantMapView.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
/// 周りの緑円
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        let myCircleView: MKCircleRenderer = MKCircleRenderer(overlay: overlay)

        myCircleView.fillColor = UIColor.green
        myCircleView.strokeColor = UIColor.green
        myCircleView.alpha = 0.05
        myCircleView.lineWidth = 5.0
        
        return myCircleView
        
    }

/// 現在地に戻る
    @IBAction func resetDisplayPosition(_ sender: UIButton) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center:center, span: span)
        restaurantMapView.region = region
    }
}
