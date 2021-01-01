//
//  FeedPostTableViewCell.swift
//  Food Discovery
//
//  Created by Jinglun Zhou on 2020/12/31.
//

import UIKit

final class FeedPostTableViewCell: UITableViewCell {
    static let identifier = "FeedPostTableViewCell"
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        
    }


}
