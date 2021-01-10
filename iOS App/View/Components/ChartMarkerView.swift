import SwiftUI
import Charts
import Foundation
import CoreGraphics
import UIKit

class ChartMarkerView: MarkerView {
    private var text = String()

    private let drawAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 17),
        .foregroundColor: UIColor.white,
        .backgroundColor: UIColor.darkGray
    ]

    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        let date = Date(timeIntervalSince1970: entry.x)
        
        text = " \(numberFormatter.string(from:NSNumber(value: entry.y)) ?? "") on \(dateFormatter.string(from: date)) "
    }

    override func draw(context: CGContext, point: CGPoint) {
        super.draw(context: context, point: point)

        let sizeForDrawing = text.size(withAttributes: drawAttributes)
        bounds.size = sizeForDrawing
        offset = CGPoint(x: -sizeForDrawing.width / 2, y: -sizeForDrawing.height - 4)

        let offset = offsetForDrawing(atPoint: point)
        let originPoint = CGPoint(x: point.x + offset.x, y: point.y + offset.y)
        let rectForText = CGRect(origin: originPoint, size: sizeForDrawing)
        drawText(text: text, rect: rectForText, withAttributes: drawAttributes)
    }

    private func drawText(text: String, rect: CGRect, withAttributes attributes: [NSAttributedString.Key: Any]? = nil) {
        let size = bounds.size
        let centeredRect = CGRect(
            x: rect.origin.x + (rect.size.width - size.width) / 2,
            y: rect.origin.y + (rect.size.height - size.height) / 2,
            width: size.width + 100,
            height: size.height + 100
        )
        text.draw(in: centeredRect, withAttributes: attributes)
    }
}
