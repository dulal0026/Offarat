# Offarat

[![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg)](https://developer.apple.com/ios/)
[![Language](https://img.shields.io/badge/Language-Swift-orange.svg)](https://swift.org)
[![Framework](https://img.shields.io/badge/UI-UIKit%20%2F%20Storyboards-purple.svg)](https://developer.apple.com/uikit/)

**Offarat** is a feature-rich, native iOS mobile application built with Swift and UIKit. It is designed to offer users a seamless platform for browsing commercial products, exploring category dashboards, managing favorites, and filtering offers or stores based on location and pricing preferences.

---

## 📱 Features & Architecture

* **Dashboard & Category Grid (`HomeVC`):** Displays dynamic product categories using a responsive `UICollectionView` layout with custom cell styling and programmatic grid sizing extensions.
* **Product Browsing & Catalogs (`BrowseVC`, `BeautyProductsVC`):** Implements dynamic `UITableView` lists supporting automatic row heights, local bundle JSON data decoding, and interactive item actions (share, location, calling, and favoriting).
* **Unified Tab & Search Bar Management (`HomeTabbarController`):** Features a customized tab bar navigation workflow with an integrated search text field embedded directly into the navigation bar title view, dynamically updating based on the selected tab.
* **Side-Drawer Navigation (`DrawerVC`):** Integrated with `KYDrawerController` to provide smooth side menu interactions.
* **Dual-Mode Favorites (`FavoriteVC`):** Uses a custom segmented control toggle to switch between saved product offers and retail stores.
* **Sorting & Filtering (`FilterVC`):** Allows users to sort listings by criteria such as "Cheapest" or "Nearest" with interactive selection feedback.

---

## 🛠️ Tech Stack & Libraries

* **Language:** Swift
* **UI Framework:** UIKit, Storyboards, XIBs / Custom Table & Collection Cells
* **Architecture:** Model-View-Controller (MVC) with modular view controllers and custom view subclasses
* **Navigation:** `KYDrawerController` (Side Drawer), `UITabBarController`, and Navigation Controllers
* **Data Handling:** Local JSON parsing via `Codable` and `JSONDecoder`

---

## 📂 Project Structure

```text
Offarat/
├── Controllers/
│   ├── HomeVC.swift             # Category dashboard & grid layout
│   ├── BrowseVC.swift           # General product catalog browsing
│   ├── BeautyProductsVC.swift   # Category-specific product lists
│   ├── FavoriteVC.swift         # Segmented favorites (Offers vs. Stores)
│   ├── FilterVC.swift           # Sorting and filtering options
│   ├── HomeTabbarController.swift # Custom tab bar and embedded search bar
│   └── DrawerVC.swift           # Side drawer container integration
├── Cells/
│   ├── CatagoryCollectionCell.swift # Collection view cell for categories
│   ├── ProductCell.swift        # Reusable product list cell with action closures
│   ├── StoreCell.swift          # Store item cell
│   └── FilterCell.swift         # Filter option list cell
└── Supporting Files/
    ├── products.json            # Mock product data source
    └── category.json            # Mock category data source
```

---

## 🚀 Getting Started

### Prerequisites
* **Xcode** 12.0 or higher
* **iOS SDK** 13.0 or higher
* **Swift** 5.0+

### Installation & Running
1. Clone the repository:
   ```bash
   git clone https://github.com/dulal0026/Offarat.git
   ```
2. Open the project directory in terminal or Finder.
3. Open the Xcode project (`.xcodeproj`).
4. Select your target simulator or connected iOS device.
5. Press `Cmd + R` to build and run the project.

---

## 👨‍💻 Author

* **Dulal Hossain** — [dulal0026](https://github.com/dulal0026)

---

## 📝 License

This project is licensed under the terms included within the repository.
