//
//  ProfileTabsCollectionReusableView.swift
//  Food Discovery
//
//  Created by Jinglun Zhou on 2021/1/1.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
        static let identifier="ProfileTabsCollectionReusableView"
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
