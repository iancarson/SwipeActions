//
//  ContentView+Basic.swift
//  Swipe
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

extension ContentView {
    @ViewBuilder var basics: some View {
        SwipeView {
            Container(title: "Basic")
        } leadingActions: { _ in
        } trailingActions: { _ in
            SwipeAction("Tap Me!") {}
        }

        SwipeView {
            Container(title: "Left and Right")
        } leadingActions: { _ in
            SwipeAction("Left") {}
        } trailingActions: { _ in
            SwipeAction("Right") {}
        }

        SwipeView {
            Container(title: "Multiple", details: #"SwipeAction("1") {}"#, #"SwipeAction("2") {}"#)
        } leadingActions: { _ in
        } trailingActions: { _ in
            SwipeAction("1") {}
            SwipeAction("2") {}
        }

        if showingSwipeToTrigger {
            SwipeView {
                Container(title: "Swipe to Trigger", details: ".swipeActionEdgeStyling()", ".swipeToTriggerTrailingEdge(true)")
            } leadingActions: { _ in
            } trailingActions: { _ in
                SwipeAction("Clear") {
                    withAnimation(.spring()) {
                        showingSwipeToTrigger = false
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring()) {
                            showingSwipeToTrigger = true
                        }
                    }
                }
                .swipeActionEdgeStyling()
            }
            .swipeToTriggerTrailingEdge(true)
        }

        if showingMultiplePlusSwipeToTrigger {
            SwipeView {
                Container(
                    title: "Multiple + Swipe to Trigger",
                    details:
                    #"SwipeAction("1") {}"#,
                    #"SwipeAction("Dismiss") {}"#,
                    ".swipeActionEdgeStyling()",
                    ".swipeToTriggerTrailingEdge(true)"
                )
            } leadingActions: { _ in
            } trailingActions: { _ in
                SwipeAction("1") {}
                SwipeAction("Dismiss") {
                    withAnimation(.spring()) {
                        showingMultiplePlusSwipeToTrigger = false
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring()) {
                            showingMultiplePlusSwipeToTrigger = true
                        }
                    }
                }
                .swipeActionEdgeStyling()
            }
            .swipeToTriggerTrailingEdge(true)
        }
    }
}
