//
//  VideoViewController.swift
//  WF
//
//  Created by Кирилл Щёлоков on 18.05.2023.
//

import UIKit
import WebKit
import SnapKit

class VideoViewController: UIViewController {
    
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loadRequest()
    }
    
    private func loadRequest() {
        guard let url = URL(string: "https://www.youtube.com/shorts/DALfkiOu1vc") else {return}
        
        let urlRrequest = URLRequest(url: url)
        
        webView.load(urlRrequest)
    }
}
