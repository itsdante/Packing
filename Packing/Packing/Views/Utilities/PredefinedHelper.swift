//
//  PredefinedHelper.swift
//  Packing
//
//  Created by Andimas Bagaswara on 11/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

func predefinedItem(gender: String, category: String, isCheckedIn: Bool) -> [String] {
    switch gender {
    case "Male":
        switch category {
        case "Essentials":
            
            return ["Passport/Visa", "Copies of Documents", "Identification", "Boarding Pass/Tickets", "Cell Phone", "Electronic Chargers", "Voltage Adaptor", "Wallet", "Emergency Contact", "House/Car Keys", "Empty Water Bottle"]
            
        case "Toiletries":
            
            return ["Band-Aids", "Conditioner", "Contacts", "Contact Solution", "Deodorant", "Cotton Pads", "Hairbrush", "Perfume", "Electric Shaver", "Shampoo", "Toothbrush", "Toothpaste", "Nail Clippers"]
            
        case "Clothing":
            return ["Belt","Casual Pants","Casual Shirts","Light Jacket (Winter/Autumn)","Pajamas","Shoes","Socks","Sweater (Winter/Autumn)","Underwear"]
            
        case "Beach":
            
            return ["Swimsuit", "Beach Bag", "Beach Towel", "Hat", "Sunglasses", "Sandals", "Portable Speaker", "Safety/Floatation Device", "Waterproof Phone Case", "Hand fan", "Aloe Vera/After Sun Care"]
            
        case "Winter":
            
            return ["Helmet", "Lip Balm", "Long Underwear", "Long-Sleeved Shirt", "Ski Gear/Rental Documents", "Snow Hat", "Snow Gloves", "Snow Goggles", "Snow Jacket", "Snow Pants", "Winter Boots"]
            
        case "Photography":
            
            return ["Batteries", "Battery Charger (Max 2)", "Camera", "Camera Bag", "Camera Charger", "Lenses", "Memory Cards", "Tripod"]
            
        case "Hike":
            
            return ["Backpack", "Binoculars", "Bug Sprays", "First Aid Kit", "Hiking Shoes", "Water Bottle"]
            
        case "Swimming":
            
            return ["Swimsuit", "Goggles", "Towel", "Swimming Cap", "Aloe Vera/After Sun Care"]
            
        case "Business":
            
            return ["Business Cards", "Laptop", "Laptop Charger", "Work Badge", "Work Phone", "Work Phone Charger"]
            
        case "Formal":
            
            return ["Dress", "Evening Bag", "High-Heels", "Jewelry", "Make-Up Bag"]
            
        case "Gym":
            
            return ["Gym Shoes", "Gym Towel", "Gym Bra", "Gym Shorts", "Gym T-Shirt", "Headphones/Earphones", "Padlock"]
            
        case "Party":
            
            return ["Dresses", "Shorts", "Hat", "Hoodie", "Rain Jacket/Poncho", "Bandana", "Flip Flops", "Bug Spray", "Dry Shampoo", "Wet Wipes", "Small Towel"]
            
        default:
            return []
        }
    default:
        switch category {
        case "Essentials":
            
            return ["Passport/Visa", "Copies of Documents", "Identification", "Boarding Pass/Tickets", "Cell Phone", "Electronic Chargers", "Voltage Adaptor", "Wallet", "Emergency Contact", "House/Car Keys", "Medications", "Empty Water Bottle"]
            
        case "Toiletries":
            if isCheckedIn == false {
                
                return ["Toothbrush", "Toothpaste", "Dental Floss", "Soap", "Deodorant", "Brush/Comb", "Face Cleanser", "Face Lotion", "Sunscreen", "Moisturizer", "Contact Lenses/Solution", "Female-Hygiene Products", "Hand Sanitizer", "Bandages"]
            }
            else {
                
                return ["Shampoo/conditioner", "Toner", "Moisturizer", "Body soap", "Face cleanser", "Face lotion", "Perfume", "Mouthwash", "Hairstyling tools", "Shaving supplies", "Makeup", "Makeup remover", "Cotton pads", "Cotton buds", "Lip balm with SPF", "Travel first aid kit", "Nail clippers", "Tweezers"]
            }
        case "Clothing":
            if isCheckedIn == false {
                
                return ["Underwear", "Shirt", "Trousers", "Sandals/Flip Flops", "Collapsible Totebag", "Purse/small daily bag"]
                
            }
            else {
                
                return ["Underwear", "Bras", "Sleepwear", "T-shirts", "Jeans/Pants", "Skirts", "Dress", "Belt", "Jewelry", "Skirt", "Socks"]
                
            }
            
        case "Beach":
            
            return ["Swimsuit","Beach Bag","Beach Towel","Hat","Sunglasses","Sandals","Portable Speaker","Safety/Floatation Device","Waterproof Phone Case","Hand fan","Aloe Vera/After Sun Care"]
            
        case "Winter":
            
            return ["Helmet", "Lip Balm", "Long Underwear", "Long-Sleeved Shirt", "Ski Gear/Rental Documents", "Snow Hat", "Snow Gloves", "Snow Goggles", "Snow Jacket", "Snow Pants", "Winter Boots"]
            
        case "Photography":
            
            return ["Batteries", "Battery Charger (Max 2)", "Camera", "Camera Bag", "Camera Charger", "Lenses", "Memory Cards", "Tripod"]
            
        case "Hike":
            
            return ["Backpack","Binoculars","Bug Sprays","First Aid Kit","Hiking Shoes","Water Bottle"]
            
        case "Swimming":
            
            return ["Swimsuit", "Goggles", "Towel", "Swimming Cap", "Aloe Vera/After Sun Care"]
            
        case "Business":
            
            return ["Business Cards", "Laptop", "Laptop Charger", "Work Badge", "Work Phone", "Work Phone Charger"]
            
        case "Formal":
            
            return ["Dress", "Evening Bag", "High-Heels", "Jewelry", "Make-Up Bag"]
            
        case "Gym":
            
            return ["Gym Shoes", "Gym Towel", "Gym Bra", "Gym Shorts", "Gym T-Shirt", "Headphones/Earphones", "Padlock"]
            
        case "Party":
            
            return ["Dresses", "Shorts", "Hat", "Hoodie", "Rain Jacket/Poncho", "Bandana", "Flip Flops", "Bug Spray", "Dry Shampoo", "Wet Wipes", "Small Towel"]
            
        default:
            return []
        }
    }
}
