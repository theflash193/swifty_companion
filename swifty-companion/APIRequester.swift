//
//  APIRequester.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 8/22/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import Foundation
import OAuth2

public class APIRequester {
    static let sharedInstance: APIRequester = APIRequester()
    
    let oauth2: OAuth2CodeGrant
    
    private init() {
        let settings = [
            "client_id": "d176271e9a621bfc52cc986b36ee5b0657d1a79c74dd760543e69fcfb61535d9",
            "client_secret": "8e4761e4756272ba9dfd27ef3220130a0052c005bf0c8163a174991c1968cb21",
            "authorize_uri": "https://api.intra.42.fr/v2/oauth/authorize",
            "token_uri": "https://api.intra.42.fr/oauth/token",   // code grant only
            "scope": "public",
            "redirect_uris": ["com.example.swifty-companion://oauth-callback"],   // register the "myapp" scheme in Info.plist
            "keychain": true,     // if you DON'T want keychain integration
            ] as OAuth2JSON
    
        oauth2 = OAuth2CodeGrant(settings: settings)
    }
    
}