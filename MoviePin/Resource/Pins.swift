//
//  Pins.swift
//  MoviePin
//
//  Created by A_Mcflurry on 1/24/24.
//

import UIKit
import MapKit

var pins: [CustomAnnotation] = [
	 CustomAnnotation(title: "CGV",
							subtitle: "CGV인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5232, longitude: 126.9809),
							type: .cgv),
	 CustomAnnotation(title: "롯데시네마",
							subtitle: "롯데시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780),
							type: .lotte),
	 CustomAnnotation(title: "메가박스",
							subtitle: "메가박스인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5483, longitude: 127.0838),
							type: .mega),
	 CustomAnnotation(title: "CGV시네마",
							subtitle: "CGV시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5535, longitude: 126.9451),
							type: .cgv),
	 CustomAnnotation(title: "롯데시네마",
							subtitle: "롯데시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5566, longitude: 126.9286),
							type: .lotte),
	 CustomAnnotation(title: "메가박스",
							subtitle: "메가박스인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5780, longitude: 127.0303),
							type: .mega),
	 CustomAnnotation(title: "CGV",
							subtitle: "CGV인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5805, longitude: 126.9242),
							type: .cgv),
	 CustomAnnotation(title: "메가시네마",
							subtitle: "메가시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.5871, longitude: 127.0082),
							type: .mega),
	 CustomAnnotation(title: "롯데시네마",
							subtitle: "롯데시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.6020, longitude: 126.9629),
							type: .lotte),
	 CustomAnnotation(title: "CGV센터",
							subtitle: "CGV터인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.4985, longitude: 127.0260),
							type: .cgv),
	 CustomAnnotation(title: "롯데시네마박스",
							subtitle: "롯데시네마박스인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3318, longitude: -122.0083),
							type: .lotte),
	 CustomAnnotation(title: "메가박스시네마",
							subtitle: "메가박스시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3310, longitude: -122.0109),
							type: .mega),
	 CustomAnnotation(title: "CGV박스",
							subtitle: "CGV박스인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3302, longitude: -122.0136),
							type: .cgv),
	 CustomAnnotation(title: "롯데시네마시네마",
							subtitle: "롯데시네마시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3294, longitude: -122.0163),
							type: .lotte),
	 CustomAnnotation(title: "메가박스박스",
							subtitle: "메가박스박스인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3286, longitude: -122.0190),
							type: .mega),
	 CustomAnnotation(title: "CGV시네마",
							subtitle: "CGV시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3278, longitude: -122.0217),
							type: .cgv),
	 CustomAnnotation(title: "롯데시네마박스",
							subtitle: "롯데시네마박스인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3270, longitude: -122.0244),
							type: .lotte),
	 CustomAnnotation(title: "메가박스시네마",
							subtitle: "메가박스시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3262, longitude: -122.0271),
							type: .mega),
	 CustomAnnotation(title: "CGV박스",
							subtitle: "CGV박스인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3254, longitude: -122.0298),
							type: .cgv),
	 CustomAnnotation(title: "롯데시네마시네마",
							subtitle: "롯데시네마시네마인듯",
							coordinate: CLLocationCoordinate2D(latitude: 37.3246, longitude: -122.0325),
							type: .lotte),
]

class CustomAnnotation: NSObject, MKAnnotation {
	var title: String?
	var subtitle: String?
	@objc dynamic var coordinate: CLLocationCoordinate2D
	let type: MovieKind

	init(title: String? = nil, subtitle: String? = nil, coordinate: CLLocationCoordinate2D, type: MovieKind) {
		self.title = title
		self.subtitle = subtitle
		self.coordinate = coordinate
		self.type = type
	}
}

enum MovieKind: String, CaseIterable {
	case mega = "메가박스"
	case lotte = "롯데시네마"
	case cgv = "CGV"
	case all = "전체보기"
}
