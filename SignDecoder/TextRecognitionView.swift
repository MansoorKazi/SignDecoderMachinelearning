//
//  TextRecognitionView.swift
//  SignDecoder
//
//  Created by Mansoor on 27/05/2025.
//

import SwiftUI

struct TextRecognitionView: View {
    let imageResource: ImageResource
    var body: some View {
        VStack{
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Spacer()
            TranslationView(text: "")
        }
        .padding()
        .navigationTitle("Sign Info")
    }
    
}

#Preview {
    NavigationStack {
        TextRecognitionView(imageResource: .sign1)
            .navigationBarTitleDisplayMode(.inline)
    }
  
}
