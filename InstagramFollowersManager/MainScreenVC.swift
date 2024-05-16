//
//  MainScreenVC.swift
//  InstagramFollowersManager
//
//  Created by Ирина Кольчугина on 16.05.2024.
//

import UIKit
import FBSDKLoginKit
import SnapKit
import AppTrackingTransparency

class MainScreenVC: UIViewController, FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print()
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        let button: UIButton = .init()
        button.setTitle("Разрешить отслеживание", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        button.addTarget(self, action: #selector(addPervision), for: .touchUpInside)

        let loginButton: FBSDKLoginButton = .init()
        view.addSubview(loginButton)
        loginButton.delegate = self
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func addPervision() {
        guard Bundle.main.object(forInfoDictionaryKey: "NSUserTrackingUsageDescription") is String else {
            print("Не найдено описание использования отслеживания. Нельзя запрашивать разрешение.")
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    print("Пользователь разрешил отслеживание.")
                default:
                    print("Пользователь не разрешил отслеживание.")
                }
            }
        })
        // Запрос разрешения

    }
}
