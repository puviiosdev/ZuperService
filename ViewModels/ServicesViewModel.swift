//
//  ServicesViewModel.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//


import Foundation
import Combine
import ServicesSampleData


@MainActor
class ServicesViewModel: ObservableObject {

    @Published var services: [Service] = []
    @Published var filteredServices: [Service] = []
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSearch()

        Task {
            await loadServices()
        }
    }

    func loadServices() async {
      

        let data = SampleData.generateServices()
        self.services = data
        self.filteredServices = data
    }

    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.filterServices(text)
            }
            .store(in: &cancellables)
    }

    private func filterServices(_ text: String) {
        guard !text.isEmpty else {
            filteredServices = services
            return
        }

        let query = text.lowercased()

        filteredServices = services.filter {
            $0.title.lowercased().contains(query) ||
            $0.customerName.lowercased().contains(query) ||
            $0.description.lowercased().contains(query)
        }
    }
}

