//
//  HeadlineCell.swift
//  MachineTest
//
//  Created by Lokesh Vyas on 15/02/22.
//

import UIKit

class HeadlineCell: UICollectionViewCell {
    @IBOutlet weak var headlineImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var contanierView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contanierView.layer.cornerRadius = 6
        contanierView.layer.masksToBounds = true
        contanierView.layer.borderWidth = 2
        contanierView.layer.borderColor =  UIColor.lightGray.cgColor
    }
    
    var articleModel : Article? {
        didSet{
            if let model = self.articleModel {
                headlineLabel?.text = model.source.name ?? ""
                if let urlString = articleModel?.urlToImage, let urlImage = URL(string: urlString) {
                    self.loadImage(url: urlImage)
                }
            }
        }
    }
    
    private func loadImage(url:URL) {
        CacheManager.shared.avatarImage(avatarSourceURL: url) { [weak self] image in
            guard let self = self,
                  let validImage = image
            else {return}
            DispatchQueue.main.async {
                self.headlineImageView?.image = validImage
            }
        }
    }
    
//    override func prepareForReuse() {
//        self.headlineImageView = nil
//        self.headlineLabel = nil
//    }
}
