//
//  SVNMaterialMenuViewController.swift
//  Tester
//
//  Created by Aaron Dean Bikis on 4/13/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import UIKit
import SVNTheme

open class SVNMaterialMenuViewController: UITableViewController {
    
    public var theme: SVNTheme!
    
    public var dataSource: [SVNMaterialMenuCell]!
    
    public init(theme: SVNTheme?, dataSource:[SVNMaterialMenuCell]?, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.theme = theme == nil ? SVNTheme_DefaultDark() : theme!
        self.dataSource = dataSource == nil ? self.setStockData() : dataSource!
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported use init(theme: dataSource: nibName: bundleName:")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutView()
        self.stylizeView()
    }
    
    private func layoutView(){
        tableView.register(SVNMaterialMenuTableViewCell.self, forCellReuseIdentifier: SVNMaterialMenuTableViewCell.reuseIdentifier)
    }
    
    private func stylizeView(){
        self.tableView.backgroundColor = self.theme.backgroundColor
        self.tableView.separatorColor = UIColor.clear
    }
    
    private func setStockData() -> [SVNMaterialMenuCell] {
        let camera = SVNMaterialMenuCell(backgroundColor: self.theme.primaryDialogColor, icon: UIImage(named: stockImages.camera)!, title: "Take A Picture")
        let document = SVNMaterialMenuCell(backgroundColor: self.theme.secondaryDialogColor, icon: UIImage(named:stockImages.document)!, title: "Write A Review")
        let location = SVNMaterialMenuCell(backgroundColor: self.theme.tertiaryDialogColor, icon: UIImage(named:stockImages.compass)!, title: "Share Your Location")
        return [camera, document, location]
    }
}

extension SVNMaterialMenuViewController {
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: SVNMaterialMenuTableViewCell.reuseIdentifier,
                                                 for: indexPath) as? SVNMaterialMenuTableViewCell
        if cell == nil {
            cell = SVNMaterialMenuTableViewCell(style: .default,
                                                reuseIdentifier: SVNMaterialMenuTableViewCell.reuseIdentifier)
        }
        cell?.set(theme: self.theme)
        cell?.header.text = dataSource[indexPath.row].title
        cell?.icon.image = dataSource[indexPath.row].icon
        cell?.contentCard.backgroundColor = dataSource[indexPath.row].backgroundColor
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        return cell!
    }
    
    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 4
    }
}

extension SVNMaterialMenuViewController {
    open override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}
