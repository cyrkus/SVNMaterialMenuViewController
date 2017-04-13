//
//  SVNMaterialMenuTableViewCell.swift
//  Tester
//
//  Created by Aaron Dean Bikis on 4/13/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import UIKit
import SVNTheme

open class SVNMaterialMenuTableViewCell: UITableViewCell {
    
    class var reuseIdentifier: String {
        get {
            return "SVNMaterialMenuTableViewCell"
        }
    }
    
    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor.clear
        return image
    }()
    
    lazy var header: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = self.theme.mediumHeading
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var contentCard: UIView = {
        let card = UIView()
        card.layer.masksToBounds = false
        card.layer.cornerRadius = 2.0
        card.layer.shadowOffset = CGSize(width: -1, height: 1)
        card.layer.shadowOpacity = 0.2
        self.addSubview(card)
        return card
    }()
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        let contentHeight: CGFloat = self.frame.height - self.frame.size.height / 4
        self.contentCard.frame = CGRect(
            x: 10,
            y: (contentHeight) / 2,
            width: self.frame.size.width - 20,
            height: contentHeight)
        
        let fullHeight: CGFloat = 80.0
        icon.frame = CGRect(
            x: (self.contentCard.frame.width - 45) / 2,
            y: (self.contentCard.frame.height - fullHeight) / 2,
            width: 45,
            height: 35)
        let y = self.icon.frame.origin.y + self.icon.frame.size.height + 10
        header.frame = CGRect(
            x: 25,
            y: y,
            width: self.contentCard.frame.size.width - 25 * 2,
            height: 35)
    }
    
    public var theme: SVNTheme = SVNTheme_DefaultDark()
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(contentCard)
        self.contentCard.addSubview(icon)
        self.contentCard.addSubview(header)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not suported")
    }
    
    
    open func set(theme: SVNTheme){
        self.theme = theme
        
    }
}
