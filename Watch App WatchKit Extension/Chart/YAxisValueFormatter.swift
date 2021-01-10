import Foundation
import Charts
class YAxisValueFormatter: NSObject, IAxisValueFormatter {

    let numFormatter: NumberFormatter

    override init() {
        numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
    }

    /// Called when a value from an axis is formatted before being drawn.
    ///
    /// For performance reasons, avoid excessive calculations and memory allocations inside this method.
    ///
    /// - returns: The customized label that is drawn on the axis.
    /// - parameter value:           the value that is currently being drawn
    /// - parameter axis:            the axis that the value belongs to
    ///

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return numFormatter.string(from: NSNumber(floatLiteral: value))!
    }
}
