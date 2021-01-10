//
//  LineChart.swift
//  Corona Widget
//
//  Created by Krish Joshi on 31/10/2020.
//

import SwiftUI
import Charts

class ChartValueFormatter: NSObject, IValueFormatter {
    fileprivate var numberFormatter: NumberFormatter?

    convenience init(numberFormatter: NumberFormatter) {
        self.init()
        self.numberFormatter = numberFormatter
    }

    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        guard let numberFormatter = numberFormatter
        else {
                return ""
        }
        return numberFormatter.string(for: value)!
    }
}

struct LineChart: UIViewRepresentable {
    var entries:[ChartDataEntry]
    @State private var chart:LineChartView = LineChartView()
    
    func makeUIView(context: Context) -> LineChartView {
        let marker = ChartMarkerView()
        marker.backgroundColor = UIColor.darkGray
        chart.data = addData()
        chart.noDataText = "Loading Chart"
        chart.marker = (marker as IMarker)
        chart.autoScaleMinMaxEnabled = true
        chart.scaleYEnabled = false
        chart.legend.enabled = false
        
        return chart
    }
    
    func addData() -> LineChartData {
        let gradientColors = [UIColor.cyan.cgColor, UIColor.clear.cgColor] as CFArray // Colors of the gradient
        let colorLocations:[CGFloat] = [1.0, 0.0] // Positioning of the gradient
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // Gradient Object
        
        let data = LineChartData()
        let dataset = LineChartDataSet(entries: entries)
        dataset.mode = .cubicBezier
        dataset.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0) // Set the Gradient
        dataset.drawFilledEnabled = true // Draw the Gradient
        dataset.drawValuesEnabled = false
        dataset.drawCirclesEnabled = false
        data.addDataSet(dataset)
        return data
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        chart.xAxis.valueFormatter = XAxisFormatter()
        chart.xAxis.granularity = 3
        chart.xAxis.labelPosition = .bottom
        chart.leftAxis.valueFormatter = YAxisValueFormatter()
        chart.rightAxis.enabled = false
        chart.data = addData()
    }
    
    
    typealias UIViewType = LineChartView
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some UIViewRepresentable {
        LineChart(entries: [ChartDataEntry(x: 10, y: 20), ChartDataEntry(x: 20, y: 40)])
    }
}
