import UIKit

// Model
struct Report {

    let id : UUID
    let year: Int
    let total: Double

    static func generateDummyReport() -> Array<Report> {

        return [Report(id: UUID(), year: Int.random(in: 2015..<2022), total: Double.random(in: 2000..<5000)),
                Report(id: UUID(), year: Int.random(in: 2015..<2022), total: Double.random(in: 2000..<5000))]
    }
}

// 1. Create a protocol
protocol ReportProtocol {
    func getReport() -> Array<Report>
}

// 2. Inherit Protocol
class TaxReport: ReportProtocol {

    func getReport() -> Array<Report> {
        print("fetching tax report")
        return Report.generateDummyReport()
    }
}

// 2. Inherit Protocol
class ProfitReport: ReportProtocol {

    func getReport() -> Array<Report> {
        
        // code for calculating profit report
        print("fetching profit report")
        return Report.generateDummyReport()
    }
}

enum ReportType {
    case tax
    case profit
}

// 3. Create a Factory Class
class ReportFactory {
    static func create(type: ReportType) -> ReportProtocol {

        switch type {
        case .tax:
            return TaxReport()
        case .profit:
            return ProfitReport()
        }
    }
}


class ReportViewModel {
    // Get rid of below objects creation as now it is responsibility of Factory class
    // private let taxReport = TaxReport() // Concreate object
    // private let profitReport = ProfitReport()

    func getReport(type: ReportType) -> Array<Report> {
        
        // 4. Call factory class methods that create objects from ViewModel
        let report = ReportFactory.create(type: type)
        return report.getReport()
        
        // Get rid of switch case too
        //        switch type {
        //        case .tax:
        //            return taxReport.getReport()
        //        case .profit:
        //            return profitReport.getReport()
        //        }
    }
}

let reportViewModel = ReportViewModel()
reportViewModel.getReport(type: .profit)
