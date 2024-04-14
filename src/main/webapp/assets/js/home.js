const movieBarArrowAction = (x) => {
	document.querySelector('.card-wrapper').scrollBy({
		left: x,
		behavior: 'smooth'
	});
};

const createMovieList = (arr) => {
	const movieBanner = document.querySelector('#banner');
	movieBanner.innerHTML = `
		<span class="arrow left material-symbols-outlined" onclick="movieBarArrowAction('-350')">chevron_left</span>
	`;

	const cardWrapper = document.createElement('div');
	cardWrapper.classList.add('card-wrapper');

	arr.forEach(el => {
		let status = "playing";
		let statusText = "상영중";

		const today = new Date();
		const startDate = new Date(el.release_date);
		const endDate = new Date(el.release_date).setDate(startDate.getDate() + 14);

		if (today > endDate) {
			status = "closed";
			statusText = "상영 종료";
		} else if (today < startDate) {
			status = "reserved";
			statusText = "개봉 예정";
		}

		const card = document.createElement('div');
		card.className = 'movieCard';

		const div = document.createElement('div');
		const link = document.createElement('a');
		link.href = `movie/showMovieDetail?mcode=${el.mcode}`;
		div.appendChild(link);

		const poster = document.createElement('img');
		poster.className = 'imgsize'
		poster.src = `assets/img/poster/${el.poster}.jpg`
		poster.alt = el.mcode;
		link.appendChild(poster);
		card.appendChild(div);
		
		const name = document.createElement('h3');
		name.classList.add('name')
		name.innerHTML = el.mname;
		card.appendChild(name);

		const statusLabel = document.createElement('span');
		statusLabel.classList.add('label', status);
		statusLabel.innerHTML = statusText;
		card.appendChild(statusLabel);

		const releasDate = document.createElement('p');
		releasDate.classList.add('release-date');
		releasDate.innerHTML = `개봉일: ${el.release_date}`;
		card.appendChild(releasDate);

		const synopsys = document.createElement('p');
		synopsys.classList.add('synopsys');
		synopsys.innerHTML = el.synopsys;
		card.appendChild(synopsys);

		cardWrapper.appendChild(card);
	});

	movieBanner.appendChild(cardWrapper);
	movieBanner.innerHTML += `
		<span class="arrow right material-symbols-outlined" onclick="movieBarArrowAction('350')">chevron_right</span>
	`;
};

const createMovieCommentsList = (arr) => {
	const posts = document.querySelector('#movie-posts');

	let row;
	arr.filter(e => (e.comments > 0)).forEach((item, index) => {
		const section = document.createElement('section');
		section.classList.add('col-6');
		section.classList.add('col-12-narrower');

		const box = document.createElement('div');
		box.classList.add('box');
		box.classList.add('post');

		const anchor = document.createElement('a');
		anchor.classList.add('image');
		anchor.classList.add('left');
		anchor.href = `movie/read?mcode=${item.mcode}&page=1`;

		const img = document.createElement('img');
		poster.src = `assets/img/poster/${el.poster}.jpg`
		img.alt = item.poster;

		const inner = document.createElement('div');
		inner.classList.add('inner');

		const h3 = document.createElement('h3');
		h3.innerHTML = item.mname;

		anchor.appendChild(img);
		inner.appendChild(h3);

		for(key in item.commentMap) {
			const comm = document.createElement('p');
			comm.innerHTML = `${item.commentMap[key]}<br>- ${key}`;
			inner.appendChild(comm);
		}

		box.appendChild(anchor);
		box.appendChild(inner);
		section.appendChild(box);

		const isRowStart = (index%2 == 0);
		if (isRowStart) {
			row = document.createElement('div');
			row.classList.add('row');
		}
		row.appendChild(section);

		if (!isRowStart) {
			posts.appendChild(row);
		}
	});
};

const homeInitialize = () => {
	const xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/movie?allComments=true');
	xhr.send();
	xhr.onload = function() {
		if (xhr.status === 200 || xhr.status === 201) {
			console.log("요청 응답 :", xhr.response);
			const arr = JSON.parse(xhr.response);

			createMovieList(arr);
			createMovieCommentsList(arr);
		}
	}
}

homeInitialize();