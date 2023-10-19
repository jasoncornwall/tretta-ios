//
//  TrettaGroupChannelViewController.swift
//  Tretta
//
//  Created by Jason C on 10/18/23.
//

import UIKit
import SendbirdUIKit
import SendbirdChatSDK

class TrettaGroupChannelViewController: SBUGroupChannelViewController {
    
    required init(channel: GroupChannel, messageListParams: MessageListParams? = nil) {
        super.init(channel: channel)
        self.headerComponent?.leftBarButton = closeBarButtonItem()
    }
    
    @MainActor required init(channelURL: String, startingPoint: Int64? = nil, messageListParams: MessageListParams? = nil) {
        fatalError("init(channelURL:startingPoint:messageListParams:) has not been implemented")
    }
    
    @MainActor required init(channelURL: String, startingPoint: Int64? = nil, messageListParams: MessageListParams? = nil, displaysLocalCachedListFirst: Bool) {
        fatalError("init(channelURL:startingPoint:messageListParams:displaysLocalCachedListFirst:) has not been implemented")
    }
    
    func closeBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeTapped))
    }
    
    @objc func closeTapped() {
        self.dismiss(animated: true)
    }
    
}
