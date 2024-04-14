const createMovieList = (arr) => {
	console.log("get api/movie", arr);
	
	const movieBanner = document.querySelector('#searchlist');
	movieBanner.innerHTML = '';
	arr.forEach(el => {
		const card = document.createElement('div');
		card.className = 'movieCard';
		
		const anchor = document.createElement('a');
		anchor.href=`read?mcode=${el.mcode}&page=1`;
		
		const poster = document.createElement('img');
		poster.src = `../assets/img/poster/${el.poster}.jpg`;
		poster.alt = el.mcode;
		anchor.appendChild(poster);
		card.appendChild(anchor);
		
		const name = document.createElement('p');
		name.innerHTML = el.mname;
		anchor.appendChild(name);
		card.appendChild(anchor);
		
		const release_date = document.createElement('p');
		release_date.innerHTML='개봉일';
		release_date.innerHTML = el.release_date;
		anchor.appendChild(release_date);
		card.appendChild(anchor);
		
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
		const statusLabel = document.createElement('span');
			statusLabel.classList.add('p', status);
			statusLabel.innerHTML = statusText;
			anchor.appendChild(statusLabel);
			card.appendChild(anchor);

	
		
		/*const synopsys = document.createElement('p');
		synopsys.innerHTML = el.synopsys;
		card.appendChild(synopsys);*/
		
		movieBanner.appendChild(card);
	});
}



const loadMoviesaerchList = () => {
	const xhr = new XMLHttpRequest();
	xhr.open('GET', '/YellowTeamProject/api/movie');
	xhr.send();
	xhr.onload = function() {
		if (xhr.status === 200 || xhr.status === 201) {
			console.log("요청 응답 :", xhr.response);
			const arr = JSON.parse(xhr.response);
			createMovieList(arr);
		}
	}
}

const form = document.forms[0];
document.querySelectorAll('option').forEach(ele => {
	if(ele.value=='${paging.column}')
		ele.selected=true;
	else	
		ele.selected=false;
});

document.querySelector('#search-btn').addEventListener('click',  () => {
	const find = document.forms[0].findText;
	const column = document.forms[0].column;
	let obj = {};

	if(find.value ==='' || column.value ==='none') {
		alert('검색어 입력과 검색 항목 선택을 하세요.')
		find.focus();
	} else {
		switch(column.value) {
		  case 'mname':
			obj.mname = find.value;
		    break;
		  case 'genre':
			obj.genre = find.value;
		    break;
		  case 'director':
			obj.director = find.value;
		    break;
		  case 'release_date':
			obj.release_date = find.value;
		    break;
		  case 'producer':
			obj.producer = find.value;
		    break;
		   case 'rating':
			obj.rating = find.value;
		    break;
		    case 'running_time':
			obj.running_time = find.value;
		    break;
		    case 'mgrade':
			obj.mgrade = find.value;
		    break;
		    case 'country':
			obj.country = find.value;
		    break;
		    case 'mcast':
			obj.mcast = find.value;
		    break;
		    
		  default:
		    break;
		}
	}
	
	
	const xhr = new XMLHttpRequest();
	xhr.open('PUT', '/YellowTeamProject/api/movie');
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(obj));
	xhr.onload = function() {
		if (xhr.status === 200 || xhr.status === 201) {
			console.log("요청 응답 :", xhr.response);
			const arr = JSON.parse(xhr.response);
			createMovieList(arr);
		}
	}
});

loadMoviesaerchList();