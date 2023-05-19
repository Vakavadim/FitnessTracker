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
	private lazy var collectionView: UICollectionView = makeCollectionView()
	private lazy var resizeButton: UIButton = makeButton()
	
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
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layout()
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
		self.addSubview(collectionView)
		self.addSubview(resizeButton)
		self.backgroundColor = .white
		collectionView.dataSource = self
		collectionView.delegate = self
		
		collectionView.register(
			OtherMonthDayCell.self,
			forCellWithReuseIdentifier: OtherMonthDayCell.reuseIdentifier
		)
		
		collectionView.register(
			CurrentMonthDayCell.self,
			forCellWithReuseIdentifier: CurrentMonthDayCell.reuseIdentifier
		)
	}
	
	/// Метод setBounds устанваливает значения Bounds для CalendarView в зависимости от значения isWeekCalendar.
	private func setBounds() {
		self.bounds = viewData.calendarViewSize
	}
	
	/// Метод changeCalendarSize меняет значение переменной isWeekCalendar,
	@objc func changeCalendarSize() {
//		setCalendarData()
		setBounds()
		layout()
		updateCollectionViewLayout()
	}
	
	/// Метод updateCollectionViewLayout обнавляет данные Calendar CollectionView
	///  и должен быть вызван в методе viewDidLayoutSubviews() родительского ViewController.
	func updateCollectionViewLayout() {
		collectionView.reloadData()
		collectionView.layoutIfNeeded()
		collectionView
			.pin
			.left(Sizes.Padding.normal)
			.right(Sizes.Padding.normal)
			.marginTop(Sizes.Padding.normal)
			.below(of: weekDays)
			.marginBottom(Sizes.Padding.minimal)
			.height(collectionView.contentSize.height)
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
		collectionView.reloadData()
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
	
	// MARK: - Make Views methods
	
	func makeLabel() -> UILabel {
		let label = UILabel()
		label.text = "Октябрь 2023"
		label.font = UIFont.preferredFont(forTextStyle: .body)
		label.textColor = .black
		
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}
	
	func makeDayLabel(day: String) -> UILabel {
		let dayLabel = UILabel()
		dayLabel.text = day
		dayLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
		dayLabel.textColor = .black
		dayLabel.textAlignment = .center
		
		dayLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate(
		 [
			dayLabel.widthAnchor.constraint(equalToConstant: Sizes.S.width)
		 ]
		)

		return dayLabel
	}
	
	func makeDayLabels(from weekDays: String) -> [UILabel] {
		var labels: [UILabel] = []
		let days = weekDays.components(separatedBy: " ")
		for day in days {
			let label = makeDayLabel(day: day)
			labels.append(label)
		}
		return labels
	}
	
	func makeWeekDaysStack() -> UIStackView {
		let stackView = UIStackView()
		let days = makeDayLabels(from: L10n.CalendarView.weekDays)
		let screenwWidth = UIScreen.main.bounds.width
		let elementWidth = Sizes.S.width
		let columnCount: CGFloat = Sizes.CalendarView.numberOfColumns
		let insertsCount: CGFloat = Sizes.CalendarView.numberOfInsections

		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.spacing = (screenwWidth - (elementWidth * columnCount) - Sizes.Padding.double) / insertsCount
		stackView.autoresizesSubviews = true
		stackView.contentMode = .scaleAspectFill

		for day in days {
			stackView.addArrangedSubview(day)
		}
		stackView.translatesAutoresizingMaskIntoConstraints = false

		return stackView
	}
	
	func makeCollectionView() -> UICollectionView {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.isScrollEnabled = false

		collectionView.translatesAutoresizingMaskIntoConstraints = false

		return collectionView
	}
	
	func makeButton() -> UIButton {
		let button = UIButton()
		button.setImage(UIImage(asset: Asset.homeIndicator), for: .normal)
		button.addTarget(self, action: #selector(changeCalendarSize), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
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
		calendarView.updateCollectionViewLayout()
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
