import Foundation
import Charts

class XAxisFormatter: NSObject,IAxisValueFormatter,IValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        let date = Date(timeIntervalSince1970: value)
        return dateFormatter.string(from: date)
    }

    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        let date = Date(timeIntervalSince1970: value)
        return dateFormatter.string(from: date)
    }
}
