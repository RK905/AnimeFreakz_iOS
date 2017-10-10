//
//  EpisodeCell.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/8/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit

class EpisodeCell: UICollectionViewCell {

    @IBOutlet weak var episodeTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 14
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.masksToBounds = false
        

    }

}
