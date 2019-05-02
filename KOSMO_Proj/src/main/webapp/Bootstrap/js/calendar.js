// 캘린더 객체
var calendar = {
	LEAF : [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ], //윤년
	PLAIN : [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ], //평년
	iscLeafCheck :
	//윤년 판단
	function(year) {
		var isc = false;
		if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) { // 윤년이면
			isc = true;
		}
		return isc;
	},
	daysY :
	//년도에 따른 일수 누적
	function(year) {
		var daySum = 0;
		for (var i = 1; i < year; i++) {
			if (this.iscLeafCheck(i)) {
				daySum += 366;
			} else {
				daySum += 365;
			}
		}
		return daySum;
	},
	daysM :
	//년도누적 + 월 일수 누적
	function(year, month) {
		var daySum = this.daysY(year);
		for (var i = 1; i < month; i++) {
			daySum += this.PLAIN[i - 1];
		}
		if (month >= 2 && this.iscLeafCheck(year)) {
			daySum++;
		}
		return daySum;
	},
	daysD :
	//년도누적 + 월 누적 + 일수 누적
	function(year, month, day) {
		return this.daysM(year, month) + day;
	},
	lastDay :
	// 구하고자 하는 년월의 최대 일수
	function(year, month) {
		var last_day = 0;
		if (this.iscLeafCheck(year)) {
			last_day = this.LEAF[month - 1];
		} else {
			last_day = this.PLAIN[month - 1];
		}
		return last_day;
	},
	isBeforeDays :
	// 앞의 달에 년도 분기
	function(year, month) {
		var days = 0;
		if (month == 1) {
			days = this.lastDay(year - 1, 12);
		} else {
			days = this.lastDay(year, month - 1);
		}
		return days;
	},
	make :
	// 해당달력을 배열로 반환
	function(year, month) {
		var dateOfWeek = (this.daysD(year, month, 1)) % 7;
		var beforeLastDay = this.isBeforeDays(year, month);
		var startLastDay = beforeLastDay - dateOfWeek + 1;
		var last_day = this.lastDay(year, month); // 구하고자 하는 년월의 최대 일수
		var lastWeekDays = (7 - (dateOfWeek + last_day) % 7) % 7;
		if (this.iscLeafCheck(year)) {
			startLastDay++;
			lastWeekDays++;
		}
		var dayArray = new Array();
		var cnt = 0;
		for (var i = startLastDay; i <= beforeLastDay; i++, cnt++) {
			dayArray[cnt] = i;
		}
		for (var i = 1; i <= last_day; i++, cnt++) {
			dayArray[cnt] = i;
		}
		for (var i = 1; i <= lastWeekDays; i++, cnt++) {
			dayArray[cnt] = i;
		}
		return dayArray;
	},
	makeOne :
	// 달력 한개만
	function(year, month){
		var last_day = this.lastDay(year, month); // 구하고자 하는 년월의 최대 일수
		var dayArray = new Array();
		var cnt = 0;
		for (var i = 1; i <= last_day; i++, cnt++) {
			dayArray[cnt] = i;
		}
		return dayArray;
	}
}