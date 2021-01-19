//
//  DoingMathApp.swift
//  DoingMath WatchKit Extension
//
//  Created by jake watkins on 1/19/21.
//

import SwiftUI

@main
struct DoingMathApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
