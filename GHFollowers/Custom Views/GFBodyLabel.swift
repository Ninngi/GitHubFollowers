//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Patryk Pawlak on 05/04/2020.
//  Copyright © 2020 Patryk Pawlak. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    init(textAligment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAligment
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.725
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
