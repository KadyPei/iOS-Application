//
//  HomeView.swift
//  Eater
//
//  Created by Tiffany Hsu on 12/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var selected = 0
    var body: some View {
        TabView(selection: $selected) {
            SearchView().tabItem({
                Image(systemName: Constants.TabBarImageName.tabBar0)
                Text("\(Constants.TabBarText.tabBar0)")
                }).tag(0)
            MyListView().tabItem({
                Image(systemName: Constants.TabBarImageName.tabBar1)
                Text("\(Constants.TabBarText.tabBar1)")
                }).tag(1)
        }
        .accentColor(Color.orange)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
