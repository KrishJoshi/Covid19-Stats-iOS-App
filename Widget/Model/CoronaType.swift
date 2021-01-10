import Foundation

enum coronaType : String {
    case total = "Total"
    case active = "Active"
    case deaths = "Deaths"
    case recovered = "Recovered"
    case confirmedToday = "Confirmed"
    

    var image : String {
        switch self {
        case .total:
            return "virus"
        case .active:
            return "bolt"
        case .deaths:
            return "coffin"
        case .recovered:
            return "cross"
        case .confirmedToday:
            return "bolt"
        }
    }
}

///END
