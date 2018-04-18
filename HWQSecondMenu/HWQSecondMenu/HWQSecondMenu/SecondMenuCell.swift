//
//  SecondMenuCell.swift
//  HWQLztUI
//
//  Created by hwq on 2018/4/17.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class SecondMenuCell: UITableViewCell {
    
    var content : UILabel! {
        didSet {
           
            content.backgroundColor = UIColor.red
            content.numberOfLines = 0
            content.textColor = UIColor.darkGray
            content.font = UIFont(name: "PingFang SC", size: 14.0)
            
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        content = UILabel()
      //  content.backgroundColor = UIColor.red
        content.numberOfLines = 0
        content.textColor = UIColor.darkGray
        content.font = UIFont(name: "PingFang SC", size: 14.0)
        content.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(content)
        let leading =  NSLayoutConstraint(item: content, attribute: .leading, relatedBy: .equal, toItem: content.superview, attribute: .leading, multiplier: 1.0, constant: 20)
        leading.isActive = true
        let trailing = NSLayoutConstraint(item: content, attribute: .trailing, relatedBy: .equal, toItem:  content.superview, attribute: .trailing, multiplier: 1.0, constant: -20)
        trailing.isActive = true
        let top = NSLayoutConstraint(item: content, attribute: .top, relatedBy: .equal, toItem: content.superview, attribute: .top, multiplier: 1.0, constant: 5)
        top.isActive = true
        let bottom = NSLayoutConstraint(item: content, attribute: .bottom, relatedBy: .equal, toItem:  content.superview, attribute: .bottom, multiplier: 1.0, constant: -5)
        bottom.isActive = true

        content.superview?.addConstraint(leading)
        content.superview?.addConstraint(trailing)
        content.superview?.addConstraint(top)
        content.superview?.addConstraint(bottom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       // content.frame = self.bounds
        
    
        
        
        
    }

    
}
