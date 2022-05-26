//
//  MockFurniture.swift
//  House
//
//  Created by User on 5/15/22.
//

import Foundation

class MockFurniture {
    private init() {}
    
    static let shared = MockFurniture()
    
    var ordersNumber: [String: Int] = [:]
    
    func getFurnitures() async throws -> [Furniture] {
        Thread.sleep(forTimeInterval: 0.5)
        return furnitures
    }
    
    func orderedFurnitures() -> [Furniture] {
        return orders.map { order -> Furniture? in
            for _ in 0 ..< order.numbersOfOrder {
                return order.furniture
            }
            return nil
        }.compactMap { $0 }
    }
    
    func numbersOfOrder(viewModel: Furniture) -> String {
        if var order = orders.first(where: { $0.furniture.imageName == viewModel.imageName }) {
            order.numbersOfOrder += 1
            if let index = orders.firstIndex(where: { $0 == order }) {
                orders.insert(order, at: index)
            }
            return "\(order.numbersOfOrder)"
        } else {
            orders.append(OrderHistory(numbersOfOrder: 1, furniture: viewModel))
            return "1"
        }
    }
    
    var orders: [OrderHistory] {
        get {
            guard let standart = UserDefaults(suiteName: "group.md.House.clip") else {
                return []
            }
            if let data = standart.value(forKey: UserDefaults.Keys.orderHistory) as? Data {
                return try! PropertyListDecoder().decode([OrderHistory].self, from: data)
            } else {
                return []
            }
        }
        set {
            guard let standart = UserDefaults(suiteName: "group.md.House.clip") else {
                return
            }
            if let data = try? PropertyListEncoder().encode(newValue) {
                standart.set(data, forKey: UserDefaults.Keys.orderHistory)
            }
        }
    }
    
    let furnitures: [Furniture] = [
        Furniture(imageName: "stul_legend_temno_zeleniy", title: "Chair", description: "Customize your industrial decor with the Hofstetler accent chair. The sleek metal frame features sinuous spring and webbed support, along with optional pintuck detailing. Choose from a range of unique upholstery options to complement your urban aesthetic.", price: "250"),
        Furniture(imageName: "stul_petty_velvet_bezheviy", title: "Chair", description: "Porthos Home Sena accent chair - gracious company for the home or office. Sometimes, an under-utilized odd corner can offer practical seating arrangement you'll appreciate with an accent chair. The Porthos Home Sena accent chair will look delightful in the living room, bedroom or small office", price: "175.49"),
        Furniture(imageName: "stul_bryan_wood_beliy", title: "Chair", description: "Perfect for that cozy nook. Featuring clean lines, the Sena accent chair is elegantly rustic, which is perfect for quickly transforming a corner into a chill-out nook without too much fuss or interfering with the rest of the room. Quite the interior decor genius, isn't it?", price: "200.99"),
        Furniture(imageName: "divan", title: "Couch", description: "Update your outdoor patio area with this outdoor high-back wicker patio furniture set. Available in an eight set, this furniture set features a modern design that fits perfectly with any outdoor or indoor decor. The furniture is weatherproof, UV-resistant, and incredibly durable. The aluminum frame of this furniture makes the sofa stronger and can carry more people", price: "1,498.99"),
        Furniture(imageName: "delicato_divan", title: "Couch", description: "This 5-Piece Sofa Seating Group with Cushions is a beautiful addition for your outdoor decor. The set includes one loveseat, two rocking chairs, one coffee table, and one side table. Crafted from metal, this set features a powder-coated finish for weather-resistant strength. And the color is neutral to match any outdoor furniture", price: "628.98"),
        Furniture(imageName: "artsone_shkaf", title: "Closet", description: "With a geometric design and classic MDF construction, use this five-tier bookcase for plenty of shelf space to hold personal items, books, or decorative accents for your room. This bookcase comes in a black or white finish to complement most decors", price: "161.48"),
        Furniture(imageName: "toled_wooden_leg_shkaf", title: "Closet", description: "Utterly charming and bundles of fun, this cube bookcase brings industrial chic to any space of your home. The numerous shelves are perfect for displaying artwork, photos, and other treasures in supreme style. A durable design is easy to assemble and compact in size for years of space-saving use", price: "215.99"),
        Furniture(imageName: "toledo_wooden_leg_tumba", title: "Half Height Door Kit", description: "The Bush Business Furniture Studio A Half Height Door Kit combines a fresh, contemporary appearance with the commercial quality construction needed to withstand years of everyday use. The cabinet doors attach to coordinating Studio A Collection Bookcases (sold separately) to conceal the materials you want kept in order but out of sight.", price: "267.09"),
        Furniture(imageName: "toledo_wooden_leg_tumba_spalna", title: "Drawer Storage", description: "Keep an organized workspace in your bedroom or home office without sacrificing visual appeal. This server brings casually chic accents like a rustic wood finish and black metal hardware to enhance the beauty of your environment. It also delivers a great work area and storage unit. A two-door cabinet with two interior shelves as well as an adjustable shelves shelf for a laptop provides all the functionality you need to work at home. so you can have customizable storage that fits your needs", price: "211.09"),
        Furniture(imageName: "amore_puff", title: "Hexagon Pouf", description: "This hexagon-shaped accent pouf provides textural chevon detailing and versatile blue and white polyester upholstery, perfect for any modern space. The study block and foam filling provides extra seating and doubles as a foot stool or a side table", price: "214.99"),
        Furniture(imageName: "praktic_kreslo", title: "Erving Boho Square Pouf ", description: "Make a tasteful addition to your home décor with the Erving  Square Pouf. The pouf is upholstered in a distressed look genuine buffalo leather with top stitching detail. Can be used as an ottoman or extra seating. This versatile pouf is sure to enhance the style of your space", price: "153.59"),
        Furniture(imageName: "alder_krovat", title: "Seaside Lodge King Headboard", description: "Find coastal calm in the warm, weathered style of the Seaside Lodge Collection. Wainscot detailing and a hand-rubbed white finish add cottage character. That relaxing weekend feel lasts the whole year through. Rustic weathered wood and a signature X-frame mark the cottage feel of the Seaside King Headboard and Nightstand by homestyles. Crafted of wire-brushed solid mahogany and mahogany veneer panels in a hand-rubbed, off-white finish. Inset panels feature an X-frame design", price: "724.84"),
        Furniture(imageName: "amore_krovat", title: "Naples Off-White Queen Bed", description: "Simply serene. The Naples Collection has a luminous white finish that celebrates clean lines and a sophisticated style. Beautifully at home wherever home may be. Turn any bedroom into a dreamy getaway with this Homestyles Naples 3-Piece Bedroom Set. Complete any room with this bed, nightstand and chest that brings a consistent style and abundant storage. The durable construction and classic finish will last through the years of daily use", price: "1,158.74"),
        Furniture(imageName: "fibril_divan", title: "Copper Grove Bielefeld", description: "Relax after a long day with this three-piece recliner sofa. This recliner sofa lets you lounge in luxurious comfort. It features full chaise pads and cushions that marry sinuous spring suspension with high-density foam fill", price: "1,091.36"),
        Furniture(imageName: "ritz_divan", title: "abric Reclining Sofa", description: "Get a taste of luxury with this transitional reclining sofa from Furniture of America. With plush foam-filled cushions, along with padded armrests and an oversized headrest wrapped in striking two-tone upholstery design, this sofa offers soft and inviting seating. A soft brown champion fabric is matched and accented by a smooth deep espresso faux leather lined around the outer edges and frame, along with stitched details. Lift the footrest easily with a manual side lever to take a midday nap or binge watch your favorite TV series. Available within this same collection is a matching reclining chair and reclining loveseat to complete your contemporary entertainment room", price: "1,349.99"),
    ]
}
