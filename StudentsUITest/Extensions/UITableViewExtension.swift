//
//  UITableViewExtension.swift
//  StudentsUITest
//
//  Created by Lucy Nguyen on 12/24/16.
//  Copyright © 2016 Lucy Nguyen. All rights reserved.
//

import UIKit

extension UITableView {
    func defaultCellWithReuseID(_ reuseID: String) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: reuseID) ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuseID)
    }
}
