function allmovie() {
    // AJAX 요청 생성
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/movie/list", true);  // GET 방식으로 '/movie/list' URL에 요청을 보냄

    // 요청이 완료되었을 때의 콜백 함수 설정
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            // 요청이 성공한 경우
            var movies = JSON.parse(xhr.responseText);  // 서버에서 받은 JSON 데이터 파싱
            // 가져온 영화 목록을 처리하는 함수 호출
            displayMovies(movies);
        } else {
            // 요청이 실패한 경우
            console.error('Request failed. Status: ' + xhr.status);
        }
    };

    // 요청 보내기
    xhr.send();
}

// 서버로부터 받은 영화 목록을 처리하는 함수
function displayMovies(movies) {
}


