//
//  CustomSearchBar.swift
//  Collaboration2
//
//  Created by nuca on 12.06.24.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var isSearching: Bool
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            searchField
            
            if isSearching {
                cancelButton
            }
        }
        .padding(.top)
    }
    
    private var searchField: some View {
        TextField("Search", text: $searchText)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    searchImage
                    
                    if isSearching {
                        xMarkButton
                    }
                }
            )
            .padding(.horizontal, 10)
            .onTapGesture {
                self.isSearching = true
            }
    }
    
    private var cancelButton: some View {
        Button("Cancel") {
            self.isSearching = false
            self.searchText = ""
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding(.trailing, 10)
        .transition(.move(edge: .trailing))
    }
    
    private var xMarkButton: some View {
        Button(action: {
            self.searchText = ""
        }) {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
    }
    
    private var searchImage: some View {
        Image(systemName: "magnifyingglass")
            .foregroundColor(.gray)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
    }
}
