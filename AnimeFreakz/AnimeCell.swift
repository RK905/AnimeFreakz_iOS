//
//  AnimeCell.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import Kingfisher

class AnimeCell: UICollectionViewCell {

    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var animeImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(_ model: animeHomeModel) {
        let url = URL(string: model.thumb!)
        self.animeImg.kf.setImage(with: url)
        self.animeTitle.text = model.title
    }

}
