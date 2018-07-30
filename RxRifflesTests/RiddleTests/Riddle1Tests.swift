import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle1Tests: XCTestCase {

    private var observer: TestableObserver<Int>!

    override func setUp() {
        super.setUp()

        let scheduler = TestScheduler(initialClock: 0)
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
    }

    func testSolve() {
        let expectation = [next(0, 5), completed(0)]
        
        _ = Riddle1().solve(value: 5).subscribe(observer)

        XCTAssertEqual(observer.events, expectation)
    }
}
