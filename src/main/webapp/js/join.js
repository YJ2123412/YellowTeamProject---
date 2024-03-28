const arrFavorite =[]        //arrFavorite.toString() 은 배열 요소로 문자열을 만들어 줍니다.post에서 사용하기
const checkFavorite =e => {
//    e.preventDefault()
    e.stopPropagation()

    const target = e.target
    if(target.tagName !== 'INPUT') {return}

    if(target.checked) arrFavorite.push(target.value)        //체크 상태이면 배열에 넣기
    else {      //체크 해제 상태이면 기존 배열에서 삭제하기
        const index = arrFavorite.indexOf(target.value);     //해당 값의 배열 위치를 알아내기
        if (index !== -1) { arrFavorite.splice(index, 1); 	}       //해당 위치에서 삭제하기
    }
	document.querySelector('#favorites').value = arrFavorite.toString()
	
    console.log(document.querySelector('#favorites').value)         //클릭하면서 결과를 콘솔에서 확인하세요.
}
// id 'checkSubjects' 는 checkbox input 모두를 포함하고 있는 div 태그 입니다.
// checkbox 요소가 많으므로 부모 요소에 이벤트를 주는 방식으로 합니다.
document.querySelector('#selfavorites').addEventListener('click', checkFavorite)













