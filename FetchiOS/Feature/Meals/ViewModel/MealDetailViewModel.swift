//
//  MealDetailViewModel.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation
import Combine

class MealDetailViewModel: ObservableObject, MealService, Loadable {
    
    var apiSession: APISessionProtocol
    
    typealias Output = MealDetailWrapper
    
    @Published var state: LoadingState<Output> = .idle
    
    private var cancellables = Set<AnyCancellable>()
    
    private var mealId: String
    init(apiSession: APISessionProtocol = APISession(),
         mealid: String) {
        self.apiSession = apiSession
        self.mealId = mealid
        self.load()
    }
    
    func load() {
        self.state = .loading
        self.loadMealDetail()
    }
    
    func loadMealDetail() {
        self.mealDetailBy(mealId: self.mealId)
            .sink { [weak self] result in
                if case .failure(let error) = result {
                    self?.state = .failed(error)
                }
            } receiveValue: { [weak self] mealWrapper in
                self?.state = .loaded(mealWrapper)
            }.store(in: &cancellables)
    }
}
