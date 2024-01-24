//
//  ViewController.swift
//  MoviePin
//
//  Created by A_Mcflurry on 1/24/24.
//

import UIKit
import MapKit

// 전에 해온거 그대로 복붙 했습니다.
class MoviePinViewController: UIViewController {

	var select: MovieKind = .all
	let locationManager = CLLocationManager()
	@IBOutlet weak var mapView: MKMapView!
	override func viewDidLoad() {
		super.viewDidLoad()
		setFilterButton()
		setMapViewDelegate()
		createAnnotaion()
		setUpLocationManager()
		checkDeviceLocationAuth()
	}
}

extension MoviePinViewController {
	func checkDeviceLocationAuth() {
		DispatchQueue.global().async {
			if CLLocationManager.locationServicesEnabled() {
				let authStatus: CLAuthorizationStatus
				if #available(iOS 14.0, *) {
					authStatus = self.locationManager.authorizationStatus
				} else {
					authStatus = CLLocationManager.authorizationStatus()
				}
				DispatchQueue.main.async {
					self.checkCurrentLocationAuth(authStatus)
				}
			} else {
				DispatchQueue.main.async {
					self.showSettingAlert()
				}
			}
		}
	}

	func checkCurrentLocationAuth(_ status: CLAuthorizationStatus) {
		switch status {
		case .notDetermined:
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.requestWhenInUseAuthorization()
		case .restricted, .denied:
			showSettingAlert()
			setupMapView()
		case .authorizedAlways, .authorizedWhenInUse:
			locationManager.startUpdatingLocation()
		@unknown default:
			print("알수없음")
		}
	}

	func showSettingAlert() {
		let alert =	UIAlertController(title: "위치정보를 가져올 수 없어요", message: "저희 서비스를 이용하시려면 설정에서 GPS 사용 설정을 켜주시기 바랍니다.", preferredStyle: .alert)
		let cancel = UIAlertAction(title: "취소", style: .cancel)
		let button1 = UIAlertAction(title: "설정으로 가기", style: .default) { _ in
			if let setting = URL(string: UIApplication.openSettingsURLString) {
				UIApplication.shared.open(setting)
			}
		}
		alert.addAction(cancel)
		alert.addAction(button1)
		present(alert, animated: true)
	}
}

extension MoviePinViewController: CLLocationManagerDelegate {
	func setUpLocationManager() {
		locationManager.delegate = self
	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		print(locations)
		if let coordinate = locations.first?.coordinate {
			let applePark = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)

			mapView.setRegion(applePark, animated: true)
			locationManager.stopUpdatingLocation()
		}
	}

	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkDeviceLocationAuth()
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		setupMapView()
	}
}

extension MoviePinViewController: MKMapViewDelegate {
	func setMapViewDelegate() {
		mapView.delegate = self
	}

	func setupMapView() {
		let seoulInitRegion = MKCoordinateRegion(
			 center: CLLocationCoordinate2D(latitude: 37.653430, longitude: 127.048784),
			 span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

		mapView.setRegion(seoulInitRegion, animated: true)
	}

	func createAnnotaion() {
		mapView.addAnnotations(pins)
	}
}

extension MoviePinViewController {
	func setFilterButton() {
		let barButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(clickRightButton))
		navigationItem.rightBarButtonItem = barButton
	}
	
	@objc func clickRightButton() {
		let alert =	UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		let cancelButton = UIAlertAction(title: "취소", style: .cancel)
		alert.addAction(cancelButton)
		
		for item in MovieKind.allCases {
			let button = UIAlertAction(title: item.rawValue, style: .default) { _ in
				self.select = item
				print(self.select.rawValue)
				
				var filteredPins: [CustomAnnotation]
				switch self.select {
				case .mega: filteredPins = pins.filter({ $0.type == .mega })
				case .lotte: filteredPins = pins.filter({ $0.type == .lotte })
				case .cgv: filteredPins = pins.filter({ $0.type == .cgv })
				case .all: filteredPins = pins
				}
				self.mapView.removeAnnotations(self.mapView.annotations)
				self.mapView.addAnnotations(filteredPins)
			}
			alert.addAction(button)
		}
		
		present(alert, animated: true)
	}
	
	
}
