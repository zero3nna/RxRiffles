import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle4Tests: XCTestCase {
    
    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Bool>!
    
    func testSolve() {
        observer = scheduler.createObserver(Bool.self)
        scheduler.start()
        let subject = PublishSubject<Void>()
        
        let firstEmit = [Recorded.next(0, true)]
        _ = Riddle4().solve(source: subject).subscribe(observer)
        subject.onNext(())
        XCTAssertEqual(observer.events, firstEmit)
        
        let secondEmit = [Recorded.next(0, true), Recorded.next(0, false)]
        subject.onNext(())
        XCTAssertEqual(observer.events, secondEmit)
        
        let thirdEmit = [Recorded.next(0, true), Recorded.next(0, false), Recorded.next(0, true)]
        subject.onNext(())
        XCTAssertEqual(observer.events, thirdEmit)
        
        let fourthEmit = [Recorded.next(0, true), Recorded.next(0, false), Recorded.next(0, true), Recorded.next(0, false)]
        subject.onNext(())
        XCTAssertEqual(observer.events, fourthEmit)
    }
}

