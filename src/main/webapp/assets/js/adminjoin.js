const button = document.querySelector('button');
 
const buttonClickHandler = () =>{
  alert('Button clicked!');
};
 
button.addEventListener('click',buttonClickHandler);
//button.removeEventListener('click', buttonClickHandler);