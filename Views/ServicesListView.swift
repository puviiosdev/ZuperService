//
//  ServicesListView.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//


import SwiftUI
import ServicesSampleData


struct ServicesListView: View {

    @StateObject private var viewModel = ServicesViewModel()

    @State private var selectedService: Service? = nil

    var body: some View {

        NavigationStack {

            VStack {

                SearchBarWithMic(text: $viewModel.searchText)
                    .padding(.bottom, 10)

                Divider()

                
                ZStack {
                    if viewModel.filteredServices.isEmpty {
                        VStack(spacing: 10) {
                            Image(systemName: "tray")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                            Text("No services found")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 15) {
                                ForEach(viewModel.filteredServices) { service in
                                    NavigationLink(destination: ServiceDetailView(service: service)) {
                                        ServiceRowView(service: service)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }

            }
            .navigationTitle("Services")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                await viewModel.loadServices()
            }
        }
    }


}

