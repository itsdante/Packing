//
//  Luggage.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import UIKit

struct Luggage: Identifiable {
    enum Category {
        case esssentials
        case toiletries
        case clothing
        case beach
        case winter
        case photography
        case hike
        case swimming
        case business
        case formal
        case gym
        case party
    }
    
    var id: String = UUID().uuidString
    var category: Category
    var isCheckedIn: Bool
    var gender : String
    
    var items: [Item] {
        switch gender {
        case "Male":
            switch category {
            case .esssentials:
                return [
                    Item(name: "Passport/Visa", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Copies of Documents", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Identification", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Boarding Pass/Tickets", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Cell Phone", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Electronic Chargers", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Voltage Adaptor", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Wallet", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Emergency Contact", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "House/Car Keys", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Empty Water Bottle", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .toiletries:
                return [
                    Item(name: "Band-Aids", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Conditioner", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Contacts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Contact Solution", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Deodorant", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Cotton Pads", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hairbrush", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Perfume", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Electric Shaver", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Shampoo", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Toothbrush", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Toothpaste", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Nail Clippers", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
                ]
            case .clothing:
                return [
                    Item(name: "Underwear", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bras", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Sleepwear", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "T-shirts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Jeans/Pants", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Skirts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Dress", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Belt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Jewelry", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Skirt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Socks", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .beach:
                return [
                    Item(name: "Swimsuit", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Beach Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Beach Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hat", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Sunglasses", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Sandals", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Portable Speaker", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Safety/Floatation Device", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Waterproof Phone Case", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hand fan", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Aloe Vera/After Sun Care", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
                ]
            case .winter:
                return [
                    Item(name: "Helmet", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Lip Balm", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Long Underwear", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Long-Sleeved Shirt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Ski Gear/Rental Documents", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Hat", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Gloves", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Goggles", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Jacket", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Pants", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Winter Boots", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .photography:
                return [
                    Item(name: "Batteries", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Battery Charger (Max 2)", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Camera", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Camera Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Camera Charger", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Lenses", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Memory Cards", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Tripod", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .hike:
                return [
                    Item(name: "Backpack", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Binoculars", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bug Sprays", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "First Aid Kit", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hiking Shoes", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Water Bottle", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .swimming:
                return [
                    Item(name: "Swimsuit", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Goggles", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Swimming Cap", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Aloe Vera/After Sun Care", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
                ]
            case .business:
                return [
                    Item(name: "Business Cards", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Laptop", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Laptop Charger", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Work Badge", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Work Phone", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Work Phone Charger", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .formal:
                return [
                    Item(name: "Dress", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Evening Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "High-Heels", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Jewelry", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Make-Up Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .gym:
                return [
                    Item(name: "Gym Shoes", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym Bra", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym Shorts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym T-Shirt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Headphones/Earphones", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Padlock", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .party:
                return [
                    Item(name: "Dresses", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Shorts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hat", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hoodie", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Rain Jacket/Poncho", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bandana", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Flip Flops", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bug Spray", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Dry Shampoo", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Wet Wipes", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Small Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            }
        default:
            switch category {
            case .esssentials:
                return [
                    Item(name: "Passport/Visa", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Copies of Documents", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Identification", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Boarding Pass/Tickets", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Cell Phone", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Electronic Chargers", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Voltage Adaptor", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Wallet", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Emergency Contact", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "House/Car Keys", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Medications", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Empty Water Bottle", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .toiletries:
                if isCheckedIn == false {
                    return [
                        Item(name: "Toothbrush", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Toothpaste", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Dental Floss", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Soap", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Deodorant", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Brush/Comb", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Face Cleanser", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Face Lotion", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Sunscreen", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Moisturizer", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Contact Lenses/Solution", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Female-Hygiene Products", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Hand Sanitizer", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Bandages", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                    ]
                }
                else {
                    return [
                        Item(name: "Toothbrush", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Toothpaste", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Dental Floss", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Soap", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Deodorant", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Brush/Comb", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Face Cleanser", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Face Lotion", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Sunscreen", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Moisturizer", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Contact Lenses/Solution", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Female-Hygiene Products", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                        Item(name: "Hand Sanitizer", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                        Item(name: "Bandages", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                    ]
                }
                
            case .clothing:
                return [
                    Item(name: "Underwear", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bras", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Sleepwear", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "T-shirts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Jeans/Pants", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Skirts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Dress", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Belt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Jewelry", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Skirt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Socks", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .beach:
                return [
                    Item(name: "Swimsuit", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Beach Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Beach Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hat", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Sunglasses", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Sandals", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Portable Speaker", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Safety/Floatation Device", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Waterproof Phone Case", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hand fan", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Aloe Vera/After Sun Care", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
                ]
            case .winter:
                return [
                    Item(name: "Helmet", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Lip Balm", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Long Underwear", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Long-Sleeved Shirt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Ski Gear/Rental Documents", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Hat", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Gloves", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Goggles", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Jacket", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Snow Pants", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Winter Boots", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .photography:
                return [
                    Item(name: "Batteries", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Battery Charger (Max 2)", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Camera", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Camera Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Camera Charger", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Lenses", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Memory Cards", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Tripod", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .hike:
                return [
                    Item(name: "Backpack", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Binoculars", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bug Sprays", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "First Aid Kit", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hiking Shoes", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Water Bottle", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .swimming:
                return [
                    Item(name: "Swimsuit", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Goggles", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Swimming Cap", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Aloe Vera/After Sun Care", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
                ]
            case .business:
                return [
                    Item(name: "Business Cards", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Laptop", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Laptop Charger", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Work Badge", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Work Phone", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Work Phone Charger", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .formal:
                return [
                    Item(name: "Dress", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Evening Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "High-Heels", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Jewelry", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Make-Up Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .gym:
                return [
                    Item(name: "Gym Shoes", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym Bra", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym Shorts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Gym T-Shirt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Headphones/Earphones", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Padlock", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            case .party:
                return [
                    Item(name: "Dresses", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Shorts", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hat", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Hoodie", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Rain Jacket/Poncho", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bandana", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Flip Flops", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Bug Spray", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date()),
                    Item(name: "Dry Shampoo", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Wet Wipes", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date()),
                    Item(name: "Small Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
                ]
            }
        }
        
    }
    
    var categoryString: String {
        switch category {
        case .esssentials:
            return "Essentials"
        case .toiletries:
            return "Toiletries"
        case .clothing:
            return "Clothing"
        case .beach:
            return "Beach"
        case .winter:
            return "Winter Sport"
        case .photography:
            return "Photography"
        case .hike:
            return "Hike"
        case .swimming:
            return "Swimming"
        case .business:
            return "Business"
        case .formal:
            return "Formal Events"
        case .gym:
            return "Gym"
        case .party:
            return "Party/Festivals"
        }
    }
    
    var categoryColor: UIColor {
        switch category {
        case .esssentials:
            return UIColor.init(hex: 0xFFC738)
        case .toiletries:
            return UIColor.init(hex: 0xFF90AB)
        case .clothing:
            return UIColor.init(hex: 0x8470FF)
        case .beach:
            return UIColor.init(hex: 0xFCAF3D)
        case .winter:
            return UIColor.init(hex: 0x82E9E3)
        case .photography:
            return UIColor.init(hex: 0x676CFF)
        case .hike:
            return UIColor.init(hex: 0x77E178)
        case .swimming:
            return UIColor.init(hex: 0x8AD5FF)
        case .business:
            return UIColor.init(hex: 0xFC8C3B)
        case .formal:
            return UIColor.init(hex: 0x2F7CF6)
        case .gym:
            return UIColor.init(hex: 0xBC6EF4)
        case .party:
            return UIColor.init(hex: 0xFF6D5F)
        }
    }
}

#if DEBUG
let luggage1 = Luggage(category: .esssentials, isCheckedIn: false, gender: "Male")
let luggage2 = Luggage(category: .toiletries, isCheckedIn: false, gender: "Male")
let luggage3 = Luggage(category: .formal, isCheckedIn: true, gender: "Male")
let luggage4 = Luggage(category: .beach, isCheckedIn: true, gender: "Male")
#endif
