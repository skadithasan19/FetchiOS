//
//  MealCategoryView.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import SwiftUI

struct MealCategoryView: View {
    @StateObject var categoryViewModel = MealViewModel()
    var body: some View {
        NavigationView {
            AsyncLoadableView(source: categoryViewModel) { mealsWrapper in
                List(mealsWrapper.meals, id: \.idMeal) { meal in
                    NavigationLink(destination: NavigationLazyView(MealDetailView(mealDetailViewModel: MealDetailViewModel(mealid: meal.idMeal)))) {
                        VStack(alignment: .leading) {
                            Text(meal.strMeal)
                            AsyncImage(url: meal.strMealThumb,
                                       content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            },
                                       placeholder: {
                                ProgressView()
                            })
                        }
                    }
                }
            }.navigationBarTitle(Text("Desserts"), displayMode: .automatic)
        }
    }
}

struct MealCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MealCategoryView()
    }
}
