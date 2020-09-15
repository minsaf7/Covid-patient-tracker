//
//  LocationInputView.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/13/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class LocationInputView: UIView {

   // MARK: - Properties

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp-1").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
       super.init(frame: frame)

        backgroundColor = .white

        addSubview(backButton)
       // backButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44,paddingLeft: 12, width: 24, height: 24)
        backButton.anchor(top: topAnchor, left: leftAnchor,  paddingTop: 40, paddingLeft: 12, height: 24, width: 24)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors

    @objc func handleBackTapped() {

    }
    // MARK: - Helper Functions

}




//new


