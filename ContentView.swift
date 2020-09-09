//
//  ContentView.swift
//  Eater
//
//  Created by Tiffany Hsu on 12/2/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var buttonTapped = false
    var body: some View {
        LoginView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
