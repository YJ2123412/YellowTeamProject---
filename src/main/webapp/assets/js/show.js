const currentTab = 'synopsys';

function showSynopsys() {
   const synopsysElement = document.getElementById('synopsys');
   const infoElement = document.getElementById('info');
   const commentList = document.getElementById('commentList');

   synopsysElement.style.display = 'block';
   infoElement.style.display = 'none';
   commentList.style.display = 'none';
}
   
function showInfo() {
   const synopsysElement = document.getElementById('synopsys');
   const infoElement = document.getElementById('info');
   const commentList = document.getElementById('commentList');
       
   infoElement.style.display = 'block';
   synopsysElement.style.display = 'none';
   commentList.style.display = 'none';
}

function showComments() {
	const synopsysElement = document.getElementById('synopsys');
    const infoElement = document.getElementById('info');
    const commentList = document.getElementById('commentList');

    infoElement.style.display = 'none';
    synopsysElement.style.display = 'none';
    commentList.style.display = 'block';
}
   
window.onload = function() {
   	const synopsysElement = document.getElementById('synopsys');
    const infoElement = document.getElementById('info');
    const commentList = document.getElementById('commentList');

    if (currentTab === 'synopsys') {
        synopsysElement.style.display = 'block';
        infoElement.style.display = 'none';
        commentList.style.display = 'none';
    } else if (currentTab === 'info') {
        synopsysElement.style.display = 'none';
        infoElement.style.display = 'block';
        commentList.style.display = 'none';
    } else {
		synopsysElement.style.display = 'none';
        infoElement.style.display = 'none';
        commentList.style.display = 'block';
	}
}

function handleBooking() {
	const current = new Date();
	console.log('schedule:', schedule);
	console.log('current:', current);   

	const oneMonthLater = new Date(current);
	oneMonthLater.setMonth(oneMonthLater.getMonth() + 1);

    if (schedule > current && schedule <= oneMonthLater) {
        location.href = 'reserve?movie_code=' + movieCode;
    } else {
        alert("해당 영화는 예매가 불가능합니다.");
    }
}
