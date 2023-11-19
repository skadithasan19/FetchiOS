//
//  MealViewModel.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation
import Combine

class MealViewModel: ObservableObject, MealCategoryService, Loadable {
    
    var apiSession: APISessionProtocol
    
    typealias Output = MealsWrapper
    
    @Published var state: LoadingState<Output> = .idle
    
    private var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APISessionProtocol = APISession()) {
        self.apiSession = apiSession
        self.load()
    }
    
    func load() {
        self.state = .loading
        self.loadMealsByDesertCategories()
    }
    
    func loadMealsByDesertCategories() {
        self.mealsByCategory(category: "Dessert")
            .sink { [weak self] result in
                if case .failure(let error) = result {
                    self?.state = .failed(error)
                }
            } receiveValue: { [weak self] mealWrapper in
                self?.state = .loaded(mealWrapper)
            }.store(in: &cancellables)
    }
}
