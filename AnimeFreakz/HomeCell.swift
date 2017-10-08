//
//  HomeCell.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var homeBody: UILabel!
    @IBOutlet weak var homeTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureWith(_ model: NewsModel) {
        let url = URL(string: model.article_img!)
        self.homeImg.kf.setImage(with: url)
        self.homeTitle.text = model.title
        self.homeBody.text = model.body
    }
}
