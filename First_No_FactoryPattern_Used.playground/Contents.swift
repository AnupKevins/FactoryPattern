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

class TaxReport {

    func getReport() -> Array<Report> {
        print("fetching tax report")
        return Report.generateDummyReport()
    }
}

class ProfitReport {

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

class ReportViewModel {
    // Violating open close principle beacuse we need to make modification in viewmodel to create objects.
    // Open Close Principle - open for extension but close for modification.
    private let taxReport = TaxReport()
    private let profitReport = ProfitReport()

    func getReport(type: ReportType) -> Array<Report> {
        
        switch type {
        case .tax:
            return taxReport.getReport()
        case .profit:
            return profitReport.getReport()
        }
    }
}

let reportViewModel = ReportViewModel()
reportViewModel.getReport(type: .profit)
