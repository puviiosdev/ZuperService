//
//  ServiceDetailView.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//



import SwiftUI
import MapKit
import ServicesSampleData

struct ServiceDetailView: View {

    let service: Service

    let coordinate = CLLocationCoordinate2D(
        latitude: 12.9654,
        longitude: 80.2461
    )

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 12.9654,
            longitude: 80.2461
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.02,
            longitudeDelta: 0.02
        )
    )


    var body: some View {
        
        VStack{
            Divider()
        
        ScrollView {
            
            Map(coordinateRegion: $region, annotationItems: [service]) { _ in
                
                MapAnnotation(coordinate: coordinate) {
                    
                    Image("pin")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
            .frame(height: 160)
            .cornerRadius(14)
            .padding(.horizontal)
            .padding(.top,5)
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    
                    Text(service.title)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    StatusBadgeView(status: service.status)
                }
                
                
                InfoRowView(
                    icon: "user-circle",
                    title: "Customer",
                    description: service.title
                )
                
                InfoRowView(
                    icon: "file-description",
                    title: "Description",
                    description: service.description
                )
                
                InfoRowView(
                    icon: "clock",
                    title: "Scheduled Time",
                    description: DateFormatterHelper.formatDate(service.scheduledDate)
                )
                
                InfoRowView(
                    icon: "pin",
                    title: "Location",
                    description: service.location
                )
                
                InfoRowView(
                    icon: "notes",
                    title: "Service Notes",
                    description: service.serviceNotes
                )
            }
            .padding()
        }
            
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }

        
    }
}








