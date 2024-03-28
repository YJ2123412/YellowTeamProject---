const dateFormat = (vdate) => { // vdate: 날짜 타입 인자
    const year = vdate.getFullYear();
    const month = (vdate.getMonth() + 2).toString().padStart(2, '0');
    const day = vdate.getDate().toString().padStart(2, '0');

    return [year,month,day].join('-');
}

const printEndDate = () => {
	document.querySelectorAll('.schedule-label').forEach(e => {
		const startDate = e.querySelector('.startDate');
		const endDate = e.querySelector('.endDate');
		if (startDate && endDate) {
			if (!startDate.innerHTML) {
				endDate.style.display = 'none';
			} else {
				endDate.innerHTML = ` ~ ${dateFormat(new Date(startDate.innerHTML))}`;
			}
		}
	});
};
printEndDate();

const getIsScheduled = (modal) => {
	const modifyModal = modal || document.querySelector('.modify-modal');
	const tempCidx	= modifyModal.querySelector('form').cidx;
	const tempSchedule	= modifyModal.querySelector('form').schedule;
	const tempScheduleEnd = modifyModal.querySelector('input[name="schedule-end"]');

	return {
		tempCidx, tempSchedule, tempScheduleEnd,
		isNotScheduled: tempCidx.disabled || tempSchedule.disabled
	};
};

document.querySelectorAll('.movie-box').forEach((el, idx) => {
	el.addEventListener('click', () => {
		const modifyModal = document.querySelector('.modify-modal');

		if (modifyModal) {
			const mcode = document.querySelector(`input[name="${idx}-mcode"]`).value;
			const mname = document.querySelector(`input[name="${idx}-mname"]`).value;
			const running_time = document.querySelector(`input[name="${idx}-running_time"]`).value;
			const director = document.querySelector(`input[name="${idx}-director"]`).value;
			const mcast = document.querySelector(`input[name="${idx}-mcast"]`).value;
			const cidx = document.querySelector(`input[name="${idx}-cidx"]`).value;
			const schedule = document.querySelector(`input[name="${idx}-schedule"]`).value;
			const synopsys = document.querySelector(`input[name="${idx}-synopsys"]`).value;

			modifyModal.querySelector('form').mcode.value = mcode;
			modifyModal.querySelector('form').mname.value = mname;
			modifyModal.querySelector('form').running_time.value = running_time;
			modifyModal.querySelector('form').director.value = director;
			modifyModal.querySelector('form').mcast.value = mcast;

			const cidxInput = modifyModal.querySelector('form').cidx;
			cidxInput.value = cidx;
			if (!cidx || !Number(cidx)) {
				cidxInput.disabled = true;
			} else {
				cidxInput.disabled = false;
			}

			const scheduleInput = modifyModal.querySelector('form').schedule;
			const scheduleEndInput = modifyModal.querySelector('input[name="schedule-end"]');
			if (!schedule.length) {
				scheduleInput.disabled = true;
				scheduleInput.value = "";
				scheduleEndInput.disabled = true;
				scheduleEndInput.value = "";
			} else {
				scheduleInput.disabled = false;
				scheduleInput.value = schedule;
				scheduleEndInput.disabled = false;
				scheduleEndInput.value = dateFormat(new Date(schedule));
			}

			modifyModal.querySelector('form').synopsys.value = synopsys;

			modifyModal.classList.remove('close');
			document.body.style.overflow = 'hidden';
		}
	});
});

document.querySelector('#changeSchedule').addEventListener('click', () => {
	const { tempCidx, tempSchedule, tempScheduleEnd, isNotScheduled } = getIsScheduled();
	if (isNotScheduled) {
		tempCidx.disabled = false;
		tempSchedule.disabled = false;
		tempScheduleEnd.disabled = false;
	}
});

document.querySelector('#modal-save').addEventListener('click', () => {
	const modifyModal = document.querySelector('.modify-modal');
	if (modifyModal) {
		const mcode	= Number(modifyModal.querySelector('form').mcode.value);
		const mname	= modifyModal.querySelector('form').mname.value;
		const running_time	= modifyModal.querySelector('form').running_time.value;
		const director	= modifyModal.querySelector('form').director.value;
		const mcast	= modifyModal.querySelector('form').mcast.value;
		const { tempCidx, tempSchedule, isNotScheduled } = getIsScheduled();
		const cidx = isNotScheduled ? undefined : Number(tempCidx.value);
		const schedule = isNotScheduled ? undefined : tempSchedule.value;
		const synopsys	= modifyModal.querySelector('form').synopsys.value;

		if (
			!isNotScheduled &&
			(!cidx || !schedule)
		) {
			alert('상영관 또는 상영 기간을 입력하세요.');
			return;
		}

		const jsObj = {
			mcode, mname, running_time, director, mcast,
			cidx: cidx === 0 ? undefined : cidx,
			schedule, synopsys
		};
		const jsStr = JSON.stringify(jsObj);

		const xhr = new XMLHttpRequest();
		xhr.open('PUT', '/YellowTeamProject/api/movie/modify', true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.send(jsStr);
		xhr.onload = function() {
			if (xhr.status === 200 || xhr.status === 201) {
				const rs = JSON.parse(xhr.response);
				if (rs.result > 0) {
					location.href = location.origin + "/YellowTeamProject/movie/modify";
				}
			} else {
				console.error("오류1 ", xhr.status);
				console.error("오류2 ", xhr.response);
			}
		}
	}
});

document.querySelector('input[name="schedule"]').addEventListener('change', (e) => {
	if (e.target.value.length > 0) {
		const end = dateFormat(new Date(e.target.value));
		document.querySelector('input[name="schedule-end"]').value = end;
	}
});

document.querySelector('#modal-close').addEventListener('click', () => {
	const modifyModal = document.querySelector('.modify-modal');
	if (modifyModal) {
		temp = {};
		modifyModal.classList.add('close');
		document.body.style.overflow = 'auto';
	}
});