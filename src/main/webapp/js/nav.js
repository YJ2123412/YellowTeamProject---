/**
 * 
 */
				const currentli = document.querySelector('li.current')
				if (currentli !=null) currentli.classList.remove('current')
					
				const liElements = document.querySelectorAll('ul#menu > li');
				//console.log(liElements)
				const idx = document.querySelector('#datanum').getAttribute("data-num")
				//console.log('**idx', idx)
				liElements[idx].classList.add('current')
				

 