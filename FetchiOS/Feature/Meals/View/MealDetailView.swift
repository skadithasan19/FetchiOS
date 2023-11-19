//
//  MealDetailView.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import SwiftUI

struct MealDetailView: View {
    
    @ObservedObject var mealDetailViewModel: MealDetailViewModel
    
    var body: some View {
        AsyncLoadableView(source: mealDetailViewModel) { mealDetail in
            List(mealDetail.meals, id: \.idMeal) { meal in
                VStack(alignment: .leading, spacing: 5) {
                    Text(meal.strMeal).font(.title)
                    Text(meal.strInstructions).font(.subheadline)
                    
                    HStack(spacing: 20) {
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("Ingredients").font(.title)
                            Divider()
                            ForEach(meal.strIngredients, id: \.self) { ingredient in
                                Text(ingredient).bold()
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Measures").font(.title)
                            Divider()
                            ForEach(meal.strMeasures, id: \.self) { measure in
                                Text(measure)
                            }
                        }
                    }.padding(.top, 40)
                }
            }
        }
    }
}

//struct MealDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailView()
//    }
//}
