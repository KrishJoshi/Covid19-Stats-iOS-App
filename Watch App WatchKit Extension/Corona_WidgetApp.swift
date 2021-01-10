//
//  Corona_WidgetApp.swift
//  Watch App WatchKit Extension
//
//  Created by Krish Joshi on 03/11/2020.
//

import SwiftUI

@main
struct Corona_WidgetApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

struct Corona_WidgetApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
