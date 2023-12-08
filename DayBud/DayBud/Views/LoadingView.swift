//
//  LoadingView.swift
//  Weather
//
//  Created by Jonathan Mascarenhas on 11/13/23.
//

import SwiftUI

// Define a SwiftUI view called LoadingView
struct LoadingView: View {
    var body: some View {
        // Display a ProgressView with a Circular style and black tint
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
            // Make the view take up the entire available space
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// Provide a preview for the LoadingView
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        // Show a preview of the LoadingView
        LoadingView()
    }
}

