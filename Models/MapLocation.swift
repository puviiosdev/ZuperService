//
//  MapLocation.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//
import MapKit

struct MapLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
