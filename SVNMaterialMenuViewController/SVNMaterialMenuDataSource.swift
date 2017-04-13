//
//  SVNMaterialMenuDataSource.swift
//  Tester
//
//  Created by Aaron Dean Bikis on 4/13/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import UIKit

public protocol SVNMaterialMenuDataSource {
    var backgroundColor: UIColor { get set }
    var icon: UIImage { get set }
    var title: String { get set }
}

public struct SVNMaterialMenuCell: SVNMaterialMenuDataSource {
    public var backgroundColor: UIColor
    public var icon: UIImage
    public var title: String
}

internal struct stockImages {
    static let compass: String = "COMPASS"
    static let document: String = "Document"
    static let camera: String = "CAMERA"
}
