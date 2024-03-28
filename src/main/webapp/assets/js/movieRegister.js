const imgSizing = (img) => {
	img.width = document.querySelector('#upload-section').clientWidth + 2;
    img.height = document.querySelector('#upload-section').clientHeight + 2;
}

document.querySelector('input#poster').addEventListener('change', (e) => {
	if (e.target.files) {
		const img = document.createElement("img");
		img.id = "img-preview";
      	img.src = URL.createObjectURL(e.target.files[0]);
      	imgSizing(img);
      	img.onload = function () {
	      console.log('@@ poster ', this.src);
	    };

	    document.querySelector('#upload-button').innerHTML = "";
	    document.querySelector('#upload-button').appendChild(img);
	} else {
		document.querySelector('#upload-button').innerHTML = "영화 포스터 업로드";
	}
});


document.querySelector('#movie-register').addEventListener('click', () => {
	const isConfirmed = confirm("영화를 등록하시겠습니까?");
	
	if(isConfirmed) {
		document.forms[0].submit();
	}
});

window.addEventListener('resize', () => {
	const preview = document.querySelector('#img-preview');
	if (preview) {
		imgSizing(preview);
	}
});