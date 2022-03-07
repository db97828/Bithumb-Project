//
//  OrderBookTickerCell.swift
//  BithumbProject
//
//  Created by 최다빈 on 2022/03/02.
//

import Foundation
import SpreadsheetView
import Then
import SnapKit
import UIKit

class OrderBookTickerCell: Cell {
    
    let lowPriceLabel = LeftTitleLabel().then {
        $0.title = "저가(1H)"
        $0.content("", color: .blue)
    }
    
    let highPriceLabel = LeftTitleLabel().then {
        $0.title = "고가(1H)"
        $0.content("", color: .red)
    }
    
    let openPriceLabel = LeftTitleLabel().then {
        $0.title = "시가(1H)"
    }
    
    let prevClosePriceLabel = LeftTitleLabel().then {
        $0.title = "전일종가"
    }
    
    let separateView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    let accTradeValueLabel = LeftTitleLabel().then {
        $0.title = "거래금"
    }
    
    let unitsTradedLabel = LeftTitleLabel().then {
        $0.title = "거래량"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let contentStackView = UIStackView(
            arrangedSubviews: [
                self.unitsTradedLabel,
                self.accTradeValueLabel,
                self.separateView,
                self.prevClosePriceLabel,
                self.openPriceLabel,
                self.highPriceLabel,
                self.lowPriceLabel
            ])
            .then {
                $0.axis = .vertical
                $0.alignment = .fill
                $0.distribution = .fill
                $0.spacing = 5
            }
        
        contentView.addSubview(contentStackView)
        contentStackView.snp.makeConstraints {
            $0.leading.equalTo(self.contentView)
            $0.trailing.equalTo(self.contentView)
            $0.bottom.equalTo(self.contentView).offset(-5)
        }
        
//        contentView.addSubview(lowPriceLabel)
//        lowPriceLabel.snp.makeConstraints {
//            $0.leading.equalTo(contentView)
//            $0.trailing.equalTo(contentView)
//            $0.bottom.equalTo(contentView).offset(-5)
//        }
//
//        contentView.addSubview(highPriceLabel)
//        highPriceLabel.snp.makeConstraints {
//            $0.leading.equalTo(contentView)
//            $0.trailing.equalTo(contentView)
//            $0.bottom.equalTo(lowPriceLabel.snp.top).offset(-5)
//        }
//
//        contentView.addSubview(openPriceLabel)
//        openPriceLabel.snp.makeConstraints {
//            $0.leading.equalTo(contentView)
//            $0.trailing.equalTo(contentView)
//            $0.bottom.equalTo(highPriceLabel.snp.top).offset(-5)
//        }
//
//        contentView.addSubview(prevClosePriceLabel)
//        prevClosePriceLabel.snp.makeConstraints {
//            $0.leading.equalTo(contentView)
//            $0.trailing.equalTo(contentView)
//            $0.bottom.equalTo(openPriceLabel.snp.top).offset(-5)
//        }
//
//        contentView.addSubview(separateView)
//        separateView.snp.makeConstraints {
//            $0.leading.equalTo(contentView).offset(5)
//            $0.trailing.equalTo(contentView).offset(-5)
//            $0.bottom.equalTo(prevClosePriceLabel.snp.top).offset(-5)
//            $0.height.equalTo(1)
//        }
//
//        contentView.addSubview(accTradeValueLabel)
//        accTradeValueLabel.snp.makeConstraints {
//            $0.leading.equalTo(contentView)
//            $0.trailing.equalTo(contentView)
//            $0.bottom.equalTo(separateView.snp.top).offset(-5)
//        }
//
//        contentView.addSubview(unitsTradedLabel)
//        unitsTradedLabel.snp.makeConstraints {
//            $0.leading.equalTo(contentView)
//            $0.trailing.equalTo(contentView)
//            $0.bottom.equalTo(accTradeValueLabel.snp.top).offset(-5)
//        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class LeftTitleLabel: UIView {
    public var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    public var content: String? {
        get { return contentLabel.text }
        set { contentLabel.text = newValue }
    }
    
    public func content(_ text: String, color: UIColor) {
        self.contentLabel.text = text
        self.contentLabel.textColor = color
        self.contentLabel.textAlignment = .right
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
        $0.textColor = .lightGray
        $0.textAlignment = .left
    }
    private let contentLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        $0.textAlignment = .right
    }

    convenience init() {
        self.init(frame: .zero)
        
        let contentStackView = UIStackView(
            arrangedSubviews: [
                self.titleLabel,
                self.contentLabel
            ])
            .then {
                $0.axis = .horizontal
//                $0.alignment = .fill
                $0.distribution = .fill
                $0.spacing = 10
            }

        self.addSubview(contentStackView)
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.leading.equalTo(self).offset(3)
            $0.trailing.equalTo(self).offset(-3)
            $0.bottom.equalTo(self)
        }
        
//        self.addSubview(titleLabel)
//        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
//        titleLabel.snp.makeConstraints {
//            $0.top.equalTo(self)
//            $0.leading.equalTo(self).offset(1)
//        }
//
//        self.addSubview(contentLabel)
//        contentLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        contentLabel.snp.makeConstraints {
//            $0.top.equalTo(self)
//            $0.leading.equalTo(titleLabel.snp.trailing)
//            $0.trailing.equalTo(self).offset(-5)
//            $0.bottom.equalTo(self)
//        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}