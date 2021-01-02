//
//  Models.swift
//  Food Discovery
//
//  Created by Jinglun Zhou on 2021/1/2.
//

import Foundation
public enum UserPostType {
    case photo, vedeo
}

enum Gender {
    case male, female
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

struct User {
    let username: String
    let name: (first: String, last:String)
    let birthDate: Date
    let joinDate: Date
    let gender : Gender
    let bio: String
    let counts :UserCount
}

public struct UserPost {
    let taggedUsers:[String]
    let createdDate: Date
    let identifier: String
    let postType: UserPostType
    let comments: [Comment]
    let postURL: URL
    let caption: String?
    let likeCount: [Like]
    let thumbnaiImage: URL
    
}

struct Like {
    let username: String
    let postIdentifier: String
    
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}

struct Comment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes : [CommentLike]
}
