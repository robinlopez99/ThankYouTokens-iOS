//
//  QRGenerator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 3/28/21.
//

import Foundation
import UIKit

final class QRGenerator {
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 5, y: 5) // Scale according to imgView
            if let output = filter.outputImage?.transformed(by: transform) {
                return convert(output)
            }
        }
        return nil
    }

    private func convert(_ cmage:CIImage) -> UIImage? {
        let context:CIContext = CIContext(options: nil)
        guard let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent) else { return nil }
        let image:UIImage = UIImage(cgImage: cgImage)
        return image
    }
}
