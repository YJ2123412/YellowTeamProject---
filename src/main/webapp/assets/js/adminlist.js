const selectAdmin = function(){
	const xhr = new XMLHttpRequest();
	xhr.open('GET', '../admin/list')
	xhr.send();
	xhr.onload = function () {
		if (xhr.status === 200 || xhr.status === 201){
			console.log("요청응답: ", xhr.response); 
            const arr = JSON.parse(xhr.response); 
            console.log("get admin/list", arr);

            const list = document.querySelector('#list');
            list.innerHTML = `
            	<li>
	        		<ul>
	        			<li class="admin"></li>
			        	<li class="admin">아이디</li>
			        	<li class="admin">닉네임</li>
			        	<li class="admin">가입날짜</li>
			        </ul>
	        	</li>
            `;
            arr.forEach((ele, index) => {
				const li = document.createElement('li');
				const ul = document.createElement('ul');
                ul.id = 'row';
                ul.innerHTML = `
	            	<li class="admin">${index + 1}</li>
	             	<li class="admin">${ele.code}</li>
	             	<li class="admin">${ele.name}</li>
	             	<li class="admin">${new Date(ele.regdate).toLocaleDateString()}</li>
                `;

                li.appendChild(ul);
                list.appendChild(li);
			})
            
		}
	}
}
selectAdmin()