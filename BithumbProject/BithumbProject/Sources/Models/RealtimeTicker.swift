//
//  RealtimeTicker.swift
//  BithumbProject
//
//  Created by 최다빈 on 2022/02/23.
//

import UIKit

enum UpDown {
    case up
    case down
    
    var color: UIColor {
        self == .up ? .systemRed : .systemBlue
    }
}

struct RealtimeTicker: Codable {
    var symbol: String?
    var tickType: String?
    var date: String?
    var time: String?
    var openPrice: String?
    var closePrice: String?
    var lowPrice: String?
    var highPrice: String?
    var value: String?
    var volume: String?
    var sellVolume: String?
    var buyVolume: String?
    var prevClosePrice: String?
    var changeRate: String?
    var changeAmount: String?
    var volumePower: String?
    
    var safeOpenPrice: Double {
        Double(openPrice ?? "0") ?? 0
    }
    var safeClosePrice: Double {
        Double(closePrice ?? "0") ?? 0
    }
    var safeLowPrice: Double {
        Double(lowPrice ?? "0") ?? 0
    }
    var safeHighPrice: Double {
        Double(highPrice ?? "0") ?? 0
    }
    var safeChangeRate: Double {
        Double(changeRate ?? "0") ?? 0
    }
    var safeChangeAmount: Double {
        Double(changeAmount ?? "0") ?? 0
    }
    var safeVolume: Double {
        Double(volume ?? "0") ?? 0
    }
    var updown: UpDown {
        safeOpenPrice <= safeClosePrice ? .up : .down
    }
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case tickType
        case date
        case time
        case openPrice
        case closePrice
        case lowPrice
        case highPrice
        case value
        case volume
        case sellVolume
        case buyVolume
        case prevClosePrice
        case changeRate = "chgRate"
        case changeAmount = "chgAmt"
        case volumePower
    }
}

extension RealtimeTicker {
    func toDomain() -> Coin {
        let acronyms = self.symbol?.components(separatedBy: "_").first ?? ""
        let ticker = Double(self.closePrice ?? "") ?? 0.0
        let rate = Double(self.changeRate ?? "") ?? 0.0
        let amount = Double(self.changeAmount ?? "") ?? 0
        let changeRate = ChangeRate(rate: rate, amount: amount)
        let transaction = Double(self.value ?? "") ?? 0.0
        let tickType = ChangeRatePeriod(rawValue: self.tickType ?? "") ?? .MID
        return .init(acronyms: acronyms, currency: .KRW, ticker: ticker, changeRate: changeRate, transaction: transaction, tickType: tickType)
    }
}
