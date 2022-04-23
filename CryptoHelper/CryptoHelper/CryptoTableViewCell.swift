//
//  CryptoTableViewCell.swift
//  CryptoHelper
//
//  Created by Kyzu on 22.04.22.
//

import Foundation
import UIKit

struct CryptoTableViewCellViewModel {
    let name, symbol, price: String
}

class CryptoTableViewCell: UITableViewCell {
    static let identifier = "CryptoTableViewCell"
    var nameLabel = UILabel()
    var symbolLabel = UILabel()
    var priceLabel = UILabel()
    
    
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
       
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel.adjustsFontSizeToFitWidth = true
        
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(priceLabel)
        setElements()
    }
    
    private func setElements(){
        NSLayoutConstraint.activate([
        
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalToConstant: 90),
            
            symbolLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            symbolLabel.widthAnchor.constraint(equalToConstant: 50),
            
            self.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),
            priceLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            priceLabel.widthAnchor.constraint(equalToConstant: 120)
        
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
