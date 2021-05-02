//
//  FeedCell.swift
//  FoodShareApp
//
//  Created by 坂田一真 on 2021/05/02.
//

import UIKit

class FeedCell:UICollectionViewCell{
    //MARK: -プロパティー
    private let profileImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "ad686c710a110693e525b2aa740ecb42")
        return iv
    }()
    
    private lazy var usernameButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("ドラえもん", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    
    private let postImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "ご飯")
        return iv
    }()
    
    private lazy var likeButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "banana"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "コメント-1"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "シェア"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLabel:UILabel = {
        let label = UILabel()
        label.text = "1 バナナ！"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let captionLabel:UILabel = {
        let label = UILabel()
        label.text = "テスト．アイウエオ．かきくけ"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let postTimeLabel:UILabel = {
        let label = UILabel()
        label.text = "1 日前"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    //MARK: -ライフサイクル
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 240/255, alpha: 1.0)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor,left: leftAnchor,paddingTop: 12,paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40/2
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView,leftAnchor: profileImageView.rightAnchor,paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor,left: leftAnchor,right: rightAnchor,
                             paddingTop: 8,paddingLeft: 5,paddingRight: 5)
        postImageView.layer.cornerRadius = 50
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButton()
        
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor,left: leftAnchor,paddingTop: -4,paddingLeft: 15)

        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor,left: leftAnchor,paddingTop: 8,paddingLeft: 15)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor,left: leftAnchor,paddingTop: 8,paddingLeft: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -セレクター
    @objc func didTapUsername(){
        print("DEBUG: ユーザネームを押した")
    }
    //MARK: -ヘルパー
    func configureActionButton(){
        let stackView = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor,left: leftAnchor,paddingLeft: 10,width: 120,height: 50)
    }
    
}
