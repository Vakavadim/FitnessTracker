//
//  CalendarView.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 24.03.2023.
//

import UIKit
import PinLayout
import SwiftUI

protocol CalendarViewDelegate: AnyObject {
	func didSelectedDate() -> Date
}

protocol CalendarViewData {
	func updateCollectionViewLayout()
	func dateSelected() -> Date
}

protocol ICalendarView: AnyObject {
	func render(viewData: CalendarModel.ViewModel)
}

class CalendarView: UIView {
	
	// MARK: - Private properties
	
	private lazy var dateLabel: UILabel = makeLabel()
	private lazy var weekDays: UIStackView = makeWeekDaysStack()
	private lazy var leftCollectionView: UICollectionView = makeCollectionView()
	private lazy var centerCollectionView: UICollectionView = makeCollectionView()
	private lazy var rightCollectionView: UICollectionView = makeCollectionView()
	private lazy var resizeButton: UIButton = makeButton()
	private lazy var scrollView: UIScrollView = makeScrollView()
	
	private var presenter: ICalendarPresenter! // swiftlint:disable:this implicitly_unwrapped_optional
	private var viewData = CalendarModel.ViewModel(
			dateString: " ",
			calendarViewSize: CGRect(),
			calendarDays: []
	)
	
	// MARK: - Lifecycle

	init() {
		super.init(frame: .zero)
		assemble()
		presenter.viewIsReady()
		setupView()
		setBounds()
		setupScrollView()
		self.dateLabel.text = viewData.dateString
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layout()
		setupScrollView()
	}
	
	// MARK: - Private methods
	
	private func assemble() {
		let calendarManager = CalendarManager()
		self.presenter = CalendarPresenter(view: self, calendarManager: calendarManager)
	}
	
	/// Add Subviews and setup collectionView.
	private func setupView() {
		self.addSubview(dateLabel)
		self.addSubview(weekDays)
		self.addSubview(scrollView)
		self.addSubview(resizeButton)
		self.backgroundColor = .white
		
		setupCollectionViews([leftCollectionView, centerCollectionView, rightCollectionView])
	}
	
	private func setupCollectionViews(_ collectionViews: [UICollectionView]) {
		for view in collectionViews {
			view.dataSource = self
			view.delegate = self
			view.register(
				CurrentMonthDayCell.self,
				forCellWithReuseIdentifier: CurrentMonthDayCell.reuseIdentifier
			)
			view.register(
				OtherMonthDayCell.self,
				forCellWithReuseIdentifier: OtherMonthDayCell.reuseIdentifier
			)
		}
	}
	
	/// Метод setBounds устанваливает значения Bounds для CalendarView в зависимости от значения isWeekCalendar.
	private func setBounds() {
		self.bounds = viewData.calendarViewSize
	}
	
	/// Метод updateCollectionViewLayout обнавляет данные Calendar CollectionView
	/// и должен быть вызван в методе viewDidLayoutSubviews() родительского ViewController.
	func updateCollectionViewLayout() {
		self.centerCollectionView.reloadData()
		self.centerCollectionView.layoutIfNeeded()
	}
	
	private func setupScrollView() {
		scrollView
			.pin
			.left()
			.right()
			.marginTop(Sizes.Padding.normal)
			.below(of: weekDays)
			.marginBottom(Sizes.Padding.minimal)
			.height(centerCollectionView.contentSize.height)
		
		let calendarViews: [UIView] = [
			self.leftCollectionView,
			self.centerCollectionView,
			self.rightCollectionView
		]
		
		for view in calendarViews {
			scrollView.addSubview(view)
		}
		
		self.scrollView.decelerationRate = .fast
		self.scrollView.showsHorizontalScrollIndicator = false
		self.scrollView.delegate = self
		self.scrollView.contentInset = UIEdgeInsets(
			top: 0.0,
			left: 16.0,
			bottom: 0.0,
			right: 32.0
		)

		let spaceBetweenItems: CGFloat = 8.0
		let horizontalItemOffsetFromSuperView: CGFloat = 16.0
		let itemWidth = self.scrollView.frame.width - horizontalItemOffsetFromSuperView * 2
		let itemHeight = self.scrollView.frame.height
		
		var startX = CGFloat.zero
		calendarViews.forEach { view in
			view.frame.origin = CGPoint(x: startX, y: CGFloat.zero)
			view.frame.size = CGSize(width: itemWidth, height: itemHeight)
			startX += view.frame.width + spaceBetweenItems
		}
		self.scrollView.contentSize = CGSize(
			width: itemWidth * CGFloat(calendarViews.count),
			height: centerCollectionView.contentSize.height
		)
	}
	
	// MARK: - Actions
	
	/// Метод changeCalendarSize меняет значение переменной isWeekCalendar,
	@objc func changeCalendarSize() {
		presenter.didPressResizeButton()
		setBounds()
	}
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		viewData.calendarDays.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = CalendarCellFactory.cellForCollectionView(
			collectionView,
			indexPath: indexPath,
			model: self.viewData.calendarDays[indexPath.item]
		)
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout {
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAt indexPath: IndexPath
	) -> CGSize {
		return CGSize(width: Sizes.S.width, height: Sizes.S.height)
	}
	
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		minimumInteritemSpacingForSectionAt section: Int
	) -> CGFloat {
		let screenwWidth = UIScreen.main.bounds.width
		let elementWidth = Sizes.S.width
		let columnCount: CGFloat = 7
		let insertsCount: CGFloat = 6
		
		return (screenwWidth - (elementWidth * columnCount) - Sizes.Padding.double) / insertsCount
	}
	
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		minimumLineSpacingForSectionAt section: Int
	) -> CGFloat {
		0
	}
}

// MARK: - ICalendarView
extension CalendarView: ICalendarView {
	func render(viewData: CalendarModel.ViewModel) {
		self.viewData = viewData
		leftCollectionView.reloadData()
		centerCollectionView.reloadData()
		rightCollectionView.reloadData()
	}
}

// MARK: - Layout Subviews
private extension CalendarView {
	func layout() {
		dateLabel
			.pin
			.top(Sizes.Padding.biggest)
			.left(Sizes.Padding.normal)
			.sizeToFit()
		
		weekDays
			.pin
			.below(of: dateLabel)
			.marginTop(Sizes.Padding.normal)
			.left(Sizes.Padding.normal)
			.right(Sizes.Padding.normal)
		
		resizeButton
			.pin
			.hCenter()
			.bottom(Sizes.Padding.minimal)
			.sizeToFit()
	}
}

// MARK: - UIScrollViewDelegate

extension CalendarView: UIScrollViewDelegate {
	func scrollViewWillEndDragging(
		_ scrollView: UIScrollView,
		withVelocity velocity: CGPoint,
		targetContentOffset: UnsafeMutablePointer<CGPoint>
	) {
		let gap: CGFloat = self.centerCollectionView.frame.width / 3
		let targetRightOffsetX = targetContentOffset.pointee.x + self.frame.width
		
		if (self.rightCollectionView.frame.minX + gap) < targetRightOffsetX {
			targetContentOffset.pointee.x = self.rightCollectionView.frame.midX - self.frame.midX
		} else if (self.leftCollectionView.frame.maxX - gap) > targetContentOffset.pointee.x {
			targetContentOffset.pointee.x = self.leftCollectionView.frame.midX - self.frame.midX
		} else {
			targetContentOffset.pointee.x = self.centerCollectionView.frame.midX - self.frame.midX
		}
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		guard
				self.leftCollectionView.frame.width > 0,
				self.centerCollectionView.frame.width > 0,
				self.rightCollectionView.frame.width > 0
				else {
			return
		}

		let gap: CGFloat = self.centerCollectionView.frame.width / 3
		let spacing: CGFloat = 8.0

		let currentRightOffset: CGFloat = scrollView.contentOffset.x + self.frame.width + scrollView.contentInset.left

		if (self.rightCollectionView.frame.maxX - gap) < currentRightOffset {
			scrollView.contentOffset.x -= self.centerCollectionView.frame.width + spacing
			presenter.forward()
			self.dateLabel.text = viewData.dateString
			centerCollectionView.reloadData()
		} else if (self.leftCollectionView.frame.minX + gap) > scrollView.contentOffset.x {
			scrollView.contentOffset.x += self.centerCollectionView.frame.width + spacing
			presenter.back()
			self.dateLabel.text = viewData.dateString
			centerCollectionView.reloadData()
		}
	}
}

// MARK: - Preview

class TestViewController: UIViewController {
	let calendarView = CalendarView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}
	
	private func layout() {
		view.addSubview(calendarView)
		calendarView.pin
			.top()
			.left()
			.right()
//		calendarView.updateCollectionViewLayout()
	}
}

#if DEBUG
struct ViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			TestViewController().preview()
		}
	}
}
#endif
