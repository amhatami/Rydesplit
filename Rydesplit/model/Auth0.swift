//
//  Auth0.swift
//  RydeSplit
//
//  Created by Pooya on 2020-02-08.
//  Copyright © 2020 RydeSplit. All rights reserved.
//


struct Auth0IOSUser: Decodable {

    //Amir Test
    let apiDomain : String = "https://dev-9fxtdhp1.auth0.com"
    let apiTokenURL : String = "https://dev-9fxtdhp1.auth0.com/oauth/token"
    let client_id : String = "Ago5Kfl1iRaNZJ953THqxCJD76qkOWmW"
    let client_secret : String = "50NcaSNTr3I2fzETuvxuR3NiutmgQ5DMJGYlK5SvmHW9_Ukpowxhy2K74Yl-bAUW"
    let audience : String = "https://dev-9fxtdhp1.auth0.com/api/v2/"
    let grant_type : String = "client_credentials"

/*
    //rydesplit Test
    let apiDomain : String = "https://dev-9fxtdhp1.auth0.com"
    let apiTokenURL : String = "https://rydesplit-dev.auth0.com/oauth/token"
    let client_id : String = "jfR6Rv6ZUSxejRqGU1MW8DQVlEkyhrUF"
    let client_secret : String = "BvOlszgtxU0gsgZC1jE34WdyrS4qjdkadWI9F13nfu-NRdSx7ujYZupSjtXN-1FG"
    let audience : String = "https://rydesplit-dev.auth0.com/api/v2/"
    let grant_type : String = "client_credentials"
*/
}

struct Token: Decodable {
    let access_token : String
    let token_type : String
    
    init() {
        access_token = "NA"
        token_type = "Bearer"
    }
}


struct User : Decodable {
    let user_id : String
    let email : String
    let email_verified : Bool
    let username : String
    let phone_number : String
    let phone_verified : Bool
    let created_at : String
    let updated_at : String
    let identities : [Identities]
//    let app_metadata : Dictionary
//    let user_metadata : Dictionary
    let picture : String
    let name : String
    let nickname : String
    let multifactor : [String]
    let last_ip : String
    let last_login : String
    let logins_count : Int
    let blocked : Bool
    let given_name : String
    let family_name : String
}

struct Identities : Decodable {
    let connection : String
    let user_id : String
    let provider : String
    let isSocial : Bool
}


struct Auth0API {
    var token : Token
    var action : String  // Create a user
    var method : String  // POST
    var urlPath : String  //  /api/v2/users
    var parameters : [String:Any]  //  body
    var responses : [String:Any]

    init() {
        token = Token()
        action = ""
        method = ""
        urlPath = ""
        parameters = [:]
        responses = [:]
    }
}


