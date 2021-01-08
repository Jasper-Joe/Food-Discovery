//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Food Discovery
//
//  Created by Jinglun Zhou on 2021/1/1.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}


final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let temp = UIImageView()
        temp.backgroundColor = .red
        temp.layer.masksToBounds = true
        return temp
    }()
    
    private let postsButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("Posts", for: .normal)
        temp.setTitleColor(.label, for: .normal)
        temp.backgroundColor = .secondarySystemBackground
        return temp
    }()
    
    private let followingButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("Following", for: .normal)
        temp.setTitleColor(.label, for: .normal)
        temp.backgroundColor = .secondarySystemBackground
        return temp
    }()
    
    private let followerButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("Followers", for: .normal)
        temp.setTitleColor(.label, for: .normal)
        temp.backgroundColor = .secondarySystemBackground
        return temp
    }()
    
    private let editProfileButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("Edit profile", for: .normal)
        temp.setTitleColor(.label, for: .normal)
        temp.backgroundColor = .secondarySystemBackground
        return temp
    }()
    
    private let nameLabel: UILabel = {
        let temp = UILabel()
        temp.text = "Jasper Zhou"
        temp.textColor = .label
        temp.numberOfLines = 1
        return temp
    }()
    
    private let bioLabel: UILabel = {
        let temp = UILabel()
        temp.text = "This for testing"
        temp.textColor = .label
        temp.numberOfLines = 0
        return temp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    private func addSubviews() {
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followerButton)
        addSubview(profilePhotoImageView)
        
    }
    
    private func addButtonActions() {
        followerButton.addTarget(self,action:#selector(didTapFollowerButton), for: .touchUpInside)
        followingButton.addTarget(self,action:#selector(didTapFollowingButton), for: .touchUpInside)
        postsButton.addTarget(self,action:#selector(didTapPostsButton), for: .touchUpInside)
        editProfileButton.addTarget(self,action:#selector(didTapProfileButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = width / 4
        profilePhotoImageView.frame = CGRect(
            x:5,
            y:5,
            width: profilePhotoSize,
            height: profilePhotoSize
        ).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        
        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth = (width - 10 - profilePhotoSize) / 3
        
        postsButton.frame = CGRect(
            x:profilePhotoImageView.right,
            y:5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followerButton.frame = CGRect(
            x:postsButton.right,
            y:5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followingButton.frame = CGRect(
            x:followerButton.right,
            y:5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        editProfileButton.frame = CGRect(
            x:profilePhotoImageView.right,
            y:5 + buttonHeight,
            width: countButtonWidth * 3,
            height: buttonHeight
        ).integral
        
        nameLabel.frame = CGRect(
            x:5,
            y:5 + profilePhotoImageView.bottom,
            width: width - 10,
            height: 50
        ).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(
            x:5,
            y:5 + nameLabel.bottom,
            width: width - 10,
            height: bioLabelSize.height
        ).integral

    }
    
    @objc private func didTapFollowerButton() {
        delegate?.profileHeaderDidTapFollowersButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
        
    }
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
        
    }
    
    @objc private func didTapProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
        
    }
}
