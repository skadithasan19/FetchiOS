//
//  NavigationLazyView.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
