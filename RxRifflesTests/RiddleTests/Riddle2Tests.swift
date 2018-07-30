import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle2Tests: XCTestCase {

    private var observer: TestableObserver<Int>!

    override func setUp() {
        super.setUp()

        let scheduler = TestScheduler(initialClock: 0)
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
    }

    func testSolve() {
        let input = Observable.from([-1, 0, 5])
        let expectation = [next(0, 0), next(0, 1), next(0, 6), completed(0)]

        _ = Riddle2().solve(source:input).subscribe(observer)

        XCTAssertEqual(observer.events, expectation)
    }
}
