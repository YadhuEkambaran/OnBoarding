//
//  OnBoardCVCell.swift
//  OnBoardDemo
//
//  Created by yadhukrishnan E on 01/05/20.
//  Copyright © 2020 AYA. All rights reserved.
//

import UIKit

class OnBoardCVCell: UICollectionViewCell {
    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    func setBoard(board: Board) {
        ivPhoto.image = UIImage(named: board.image)
        labelHeader.text = board.heading!
        labelDescription.text = board.description!
        self.contentView.backgroundColor = UIColor(hexa: board.color)
    }
}

extension UIColor {
    convenience init?(hexa: String) {
        var hexSanitized = hexa.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt32 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
