//
//  HomeScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import RevenueCat
import RevenueCatUI
import SwiftUI

struct HomeScreen: View {
    @Binding var route: Route
    @StateObject var model: HomeScreenModel
    @State private var loadingState: LoadingState = .loading
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Group {
                    VStack {
                        switch loadingState {
                        case .loading:
                            Spacer()
                                .frame(height: 250)
                            ProgressView()
                                .controlSize(.large)
                                .frame(maxWidth: .infinity)
                        case .empty:
                            EmptyStateView(type: .homeGraph)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.bottom, 200)
                        case .complete:
                            VStack {
                                DashboardChart(
                                    deals: $model.deals,
                                    chartType: .bar
                                )
                                .padding(.horizontal, 16)
                                .padding(.bottom, 24)
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.white.opacity(0.8))
                                    .padding(.bottom, 24)
                                
                                DashboardChart(
                                    deals: $model.deals,
                                    chartType: .point
                                )
                                .padding(.horizontal, 16)
                                Spacer()
                            }
                            .padding(.bottom, 44)
                        }
                    }
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.backgroundBlue)
                    .tint(.trettaGold)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            if !model.pipelines.isEmpty {
                                DropdownMenu(selection: $model.currentPipelineSelection.onChange(pipelineSelectionChange(to:)), pipelines: model.pipelines)
                                     .padding(.trailing, 16)
                                     .padding(.bottom, 8)
                            }
                        }
                    }
                }
                .navigationTitle("Dashboard")
                .navigationBarBackButtonHidden(true)
            }
            .background(Color.backgroundBlue)
        }
        .task {
            AnalyticsManager.shared.log(.homeScreenViewed)
            
            model.loadPipelines { error in
                if let error, let statusCode = error.responseCode, statusCode == 500 || statusCode == 401 {
                    // Logout and clear access token/accountId for 401/500 response codes
                    KeyStorage.shared.clearValue(forKey: Constants.accessToken)
                    KeyStorage.shared.clearValue(forKey: Constants.accountIdKey)
                    route = .onboarding(.signIn)
                } else {
                    model.loadDeals(pipelineId: model.currentPipelineSelection._id) {
                        loadingState = !model.deals.isEmpty ? .complete : .empty
                    }
                }
            }
        }
//        .debugRevenueCatOverlay()
        .presentPaywallIfNeeded { customerInfo in
            return customerInfo.entitlements.active.keys.contains(Constants.requiredEntitlementIdentifier)
        } purchaseCompleted: { customerInfo in
                print("Purchase completed: \(customerInfo.entitlements)")
        } restoreCompleted: { customerInfo in
            // Paywall will be dismissed automatically if "pro" is now active.
            print("Purchases restored: \(customerInfo.entitlements)")
        }
//        .presentPaywallIfNeeded(
//            requiredEntitlementIdentifier: Constants.requiredEntitlementIdentifier,
//            purchaseCompleted: { customerInfo in
//                return customerInfo.entitlements.active.keys.contains("pro")
////                print("Purchase completed: \(customerInfo.entitlements)")
//        }, restoreCompleted: { customerInfo in
////            print("Restome completed: \(customerInfo.entitlements)")
//        }) {
//            /// Decided to opt for commenting out this code to avoid unnecessary friction for users that fully intend to pay, since this block seems to be
//            /// erroneously called after successful payments too.
//            // In prod we should logout the user if they refuse to pay.
////            if BuildConfiguration.shared.environment == .production {
////                AnalyticsManager.shared.log(.cancelPaymentTapped)
////                KeyStorage.shared.clearValue(forKey: Constants.accessToken)
////                KeyStorage.shared.clearValue(forKey: Constants.accountIdKey)
////                route = .onboarding(.signIn)
////            }
//        }
    }
    
    func pipelineSelectionChange(to value: Pipeline) {
        // Reload local pipeline data
        model.loadDeals(pipelineId: value._id) {
            loadingState = !model.deals.isEmpty ? .complete : .empty
        }
    }
}
