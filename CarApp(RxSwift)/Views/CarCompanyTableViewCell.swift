//
//  CarCompanyTableViewCell.swift
//  CarApp(RxSwift)
//
//  Created by Никита Гуляев on 02.04.2022.
//

import UIKit

class CarCompanyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CarCompanyCell"
    
    let cellCarImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    let carsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellCarImageView)
        contentView.addSubview(carsLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        cellCarImageView.frame = CGRect(
            x: 16,
            y: 0,
            width: contentView.frame.size.height,
            height: contentView.frame.size.height
        )
        carsLabel.frame = CGRect(
            x: cellCarImageView.frame.size.height + 20,
            y: 0,
            width: contentView.frame.size.width,
            height: contentView.frame.size.height
        )
    }
}
