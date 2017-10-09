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
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        

    }

}
