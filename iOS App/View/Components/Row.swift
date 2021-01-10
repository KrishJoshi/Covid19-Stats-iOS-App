import SwiftUI

struct Row: View {
    var country: String
    var count: String
    var flag: String
    var body: some View {
        HStack(alignment: .top) {
            Text(flag)
            VStack() {
            Text(country)
            }.frame(maxWidth: .infinity, alignment: .leading)
            Text(count)
                .fontWeight(.bold)
        }
        .padding(20)
        .background(Color(.lightGray).opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10 )
        .foregroundColor(Color.white)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(country: "United Kingdom", count: "1234", flag: "🇬🇧")
    }
}
