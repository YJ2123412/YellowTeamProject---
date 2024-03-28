const cancelButtons = document.querySelectorAll(".cancel");
    cancelButtons.forEach(button => {
        button.addEventListener('click', function(){
            if(confirm('예매를 취소하시겠습니까?')){
                const form = button.closest("form");
                form.submit(); 
                alert("취소되었습니다.");
            }
        });
    });
 