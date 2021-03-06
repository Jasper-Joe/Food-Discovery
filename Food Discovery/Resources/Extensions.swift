//
//  Extensions.swift
//  Food Discovery
//
//  Created by Jinglun Zhou on 2020/12/30.
//

import UIKit

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return frame.size.height + frame.origin.y
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.origin.x + frame.width
    }
}

extension String {
    // database cannot have strings with dots as key
     func convertEmail() -> String {
        return self.replacingOccurrences(of: "@", with: "-").self.replacingOccurrences(of: ".", with: "-")
    }
}
