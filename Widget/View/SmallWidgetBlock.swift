import SwiftUI

struct smallWidgetBlock : View {
    var type : coronaType
    var count : Double
    var color : Color
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content:
         {
          
           Text(type.rawValue)
                .lineLimit(1)
                .font(.system(size: 12))

            Text(count.cases)
                .bold()
                .foregroundColor(color)
                .font(.system(size: 15))

         }).frame(height: 60)
    }
}

struct SmallWidgetBlock_Previews: PreviewProvider {
    static var previews: some View {
        smallWidgetBlock(type:.total, count: 10, color: .red)
    }
}
