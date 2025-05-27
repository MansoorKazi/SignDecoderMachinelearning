//
//   TextRecognizer.swift
//  SignDecoder
//
//  Created by Mansoor on 27/05/2025.
//

import Foundation
import SwiftUI
import Vision

struct TextRecognition{
    var recognizedText = ""
    var observations : [RecognizedTextObservation] = []
    
    init(imageResource: ImageResource) async {
        
        var request = RecognizeTextRequest()
        request.recognitionLevel = .accurate
        
        let image = UIImage(resource: imageResource)
        
        /// Convert the UIImage to Data.
        /// Calling pngData() exports a copy of the image in the PNG data format.
        /// Use try, because the operation can fail. Also, mark your initializer function with async, because it’s waiting on the results from another async function before returning.
        
        if let imageData = image.pngData(),
            let results = try? await request.perform(on: imageData){
                observations = results
            }
        
        /// Iterate through the observations and get the top candidate of the potential text values.
        /// The topCandidates function returns an array with the possible values for the text.
        /// Text recognition in an image can result in multiple potential values if the model isn’t completely accurate or when the text doesn’t stand out clearly enough.
        /// The integer passed in to topCandidates is the maximum number of possible values to return.
        ///  In this case, topCandidates will only return an array with the most likely value. Passing in a value greater than 1 will provide an array with more items if RecognizeTextRequest identifies more possible results.
        for observation in observations{
            let candidate = observation.topCandidates(1)
        /// Declare a variable for all of the text contained in the image. Whenever usable text is found, add it to the property.
            if let observedText = candidate.first?.string{
                recognizedText += "\(observedText) "
            }
               
        }
        }
}
