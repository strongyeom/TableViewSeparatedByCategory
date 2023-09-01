//
//  TvTableViewCell.swift
//  TableViewSeparatedByCategory
//
//  Created by 염성필 on 2023/09/02.
//

import UIKit
import SnapKit

class TVTableViewCell : UITableViewCell {
    
    let mediaImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.backgroundColor = .gray
        return image
    }()
    
    let titleLabel = {
       let label = UILabel()
        label.text = "제목"
        label.backgroundColor = .red
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    let descriptionLabel = {
       let label = UILabel()
        label.text = "자재로 늘일 수 있지만 수영을 할 수가 없는 처지이다. 바다가 주 활동무대인 해적에게 있어 수영은 필수. 그러나 해적왕을 꿈꾸는 루피는 수영을 할 수 없음에도 불구하고 물에 빠지지 않으면 된다면서 자신의 꿈을 향해 모험을 떠난다. 그 과정에서 만나게 되는 현상금 헌터 ‘조로’, 자칭 해적전문 도둑인 ‘나미’, 저격수 ‘우솝, 그리고 주방장 ‘상디’까지. 지금부터 루피와 그의 동료 4명이 함께하는 해적의 꿈을 향한 파란만장한 모험이"
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        [mediaImageView, titleLabel, descriptionLabel].forEach {
            self.addSubview($0)
        }
    }
    
    func setConstraints() {
        mediaImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview().inset(10)
            make.width.equalTo(80)
            make.height.equalTo(mediaImageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mediaImageView.snp.top)
            make.trailing.equalTo(mediaImageView.snp.leading).offset(-10)
        }
        
        descriptionLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.bottom.equalTo(mediaImageView.snp.bottom)
            make.leading.equalToSuperview().inset(10)
        }
        
    }
    
//    func changeSetConstraint() {
//        mediaImageView.snp.remakeConstraints { make in
//            make.center.equalToSuperview()
//        }
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        mediaImageView.image = nil
//    }
//
}
