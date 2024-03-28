/**
 * 
 */
 // header
					
function header(){
  $('.menu-wrap').hover(function(){
    $('.header-wrap').addClass('hover');
  },function(){
    $('.header-wrap').removeClass('hover');
  });
}

function newsSlider(){
  var swiper = new Swiper('.news .gall', {
      loop: false,
      spaceBetween : 10,
      slidesPerView:4,
      slidesPerGroup: 1,
      navigation: {
        nextEl: '.ico.ico-next',
        prevEl: '.ico.ico-prev',
      },
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      autoplay: {
        delay: 4000,
      },
  });
}

function mainSlider(){
  var swiper = new Swiper('.main-banner .slider', {
      loop: false,
      spaceBetween : 0,
      slidesPerView:1,

      effect : 'fade', // 페이드 효과 사용
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      autoplay: {
        delay: 4000,
      },
  });
}
/*
function logoSlider(){
  var swiper = new Swiper('.partner .slider', {
      speed: 500,
      loop: true,
      slidesPerView:5,
      slidesPerGroup: 1,
      navigation: {
        nextEl: '.ico.ico-next',
        prevEl: '.ico.ico-prev',
      },
      autoplay: {
        delay: 2000,
      },
  });
}
*/
function parkSlider(){
  var swiper = new Swiper('.slider .park', {
      speed: 1000,
      loop: true,
      slidesPerView:2,
      spaceBetween:20,
      slidesPerGroup: 2,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      navigation: {
        nextEl: '.ico.ico-next',
        prevEl: '.ico.ico-prev',
      },
      autoplay: {
        delay: 3000,
      },
  });
}

function playerSlider(){
  var swiper = new Swiper('.slider .player-box', {
      speed: 1000,
      loop: true,
      slidesPerView:1,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      autoplay: {
        delay: 3000,
      },
  });
}

function imgSlider(){
  var swiper = new Swiper('.img-wrap .slider', {
      loop: true,
      slidesPerView:1,
      slidesPerGroup: 1,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      autoplay: {
        delay: 2000,
      }
  });
  var swiper = new Swiper('.img-wrap .slider2', {
      loop: true,
      slidesPerView:1,
      slidesPerGroup: 1,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      autoplay: {
        delay: 2000,
      },
      observer: true,
      observeParents: true,
  });
}

function thumbsSlide(){
  var galleryThumbs = new Swiper('.gall-thumbs .thumbs', {
    direction: 'vertical',
    slidesPerView: 4,
    spaceBetween: 20,
    freeMode: true,
    navigation: {
      nextEl: '.ico.ico-next',
      prevEl: '.ico.ico-prev',
    },
    watchSlidesProgress: true,
    autoplay: {
      delay: 3000,
    },
  });
  var galleryTop = new Swiper('.gall-top', {
    loop: true,
    thumbs: {
      swiper: galleryThumbs,
    },
    autoplay: {
      delay: 3000,
    }
  });
}

function thumbsSlide02(){
  var galleryThumbs = new Swiper('.gall-thumbs02 .thumbs', {
    direction: 'vertical',
    slidesPerView: 4,
    spaceBetween: 20,
    freeMode: true,
    navigation: {
      nextEl: '.ico.ico-next',
      prevEl: '.ico.ico-prev',
    },
    watchSlidesProgress: true,
    autoplay: {
      delay: 3000,
    },
  });
  var galleryTop = new Swiper('.gall-top02', {
    loop: true,
    thumbs: {
      swiper: galleryThumbs,
    },
    autoplay: {
      delay: 3000,
    }
  });
}

function thumbsSlide03(){
  var galleryThumbs = new Swiper('.gall-thumbs03 .thumbs', {
    direction: 'vertical',
    slidesPerView: 4,
    spaceBetween: 20,
    freeMode: true,
    navigation: {
      nextEl: '.ico.ico-next',
      prevEl: '.ico.ico-prev',
    },
    watchSlidesProgress: true,
    autoplay: {
      delay: 3000,
    },
  });
  var galleryTop = new Swiper('.gall-top03', {
    loop: true,
    thumbs: {
      swiper: galleryThumbs,
    },
    autoplay: {
      delay: 3000,
    }
  });
}

function thumbsSlide04(){
  var galleryThumbs = new Swiper('.gall-thumbs04 .thumbs', {
    direction: 'vertical',
    slidesPerView: 4,
    spaceBetween: 20,
    freeMode: true,
    navigation: {
      nextEl: '.ico.ico-next',
      prevEl: '.ico.ico-prev',
    },
    watchSlidesProgress: true,
    autoplay: {
      delay: 3000,
    },
  });
  var galleryTop = new Swiper('.gall-top04', {
    loop: true,
    thumbs: {
      swiper: galleryThumbs,
    },
    autoplay: {
      delay: 3000,
    }
  });
}
function thumbsSlide05(){
  var galleryThumbs = new Swiper('.gall-thumbs05 .thumbs', {
    direction: 'vertical',
    slidesPerView: 4,
    spaceBetween: 20,
    freeMode: true,
    navigation: {
      nextEl: '.ico.ico-next',
      prevEl: '.ico.ico-prev',
    },
    watchSlidesProgress: true,
    autoplay: {
      delay: 3000,
    },
  });
  var galleryTop = new Swiper('.gall-top05', {
    loop: true,
    thumbs: {
      swiper: galleryThumbs,
    },
    autoplay: {
      delay: 3000,
    }
  });
}
// tab container
function tabContainer(){
  $('.tabs button, .tabs li').click(function() {
    $(this).addClass('active').siblings().removeClass('active');
    var index = $(this).index();
    var contWrap = $(this).parent('.tabs').siblings('.tab-container');
    contWrap.find('.cont').eq(index).addClass('active').siblings('.cont').removeClass('active');
  });
  $('.tabs2 li').click(function() {
    $(this).addClass('active').siblings().removeClass('active');
    var index = $(this).index();
    var contWrap = $(this).parent('.tabs2').siblings('.tab-container2');
    contWrap.find('.cont2').eq(index).addClass('active').siblings('.cont2').removeClass('active');
  });
}

function openDialog(e){
  $("#" + e).removeClass('is-visible');
}

function modalSlider(){
  $(".modal .slider").each(function (index, element) {
    var $this = $(this);
    $this.addClass('instance-' + index);

    var swiper = new Swiper('.instance-' + index, {
      observer: true,
      observeParents: true,
      slidesPerView: 1,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      navigation: {
        nextEl: '.ico.ico-next.ico-next2',
        prevEl: '.ico.ico-prev.ico-prev2',
      },
      watchOverflow: true,
      autoplay: {
        delay: 3000,
      },
    });
  });
};

function gameSlider(initialSlide){
  $(".timetable .slider .wrap").each(function (index, element) {
    var $this = $(this);
    $this.addClass('instance-' + index);

    var swiper = new Swiper('.instance-' + index, {
      initialSlide: initialSlide, // 슬라이드 시작점 지정
      observer: true,
      observeParents: true,
      loop: false,
      slidesPerView: 'auto',
      navigation: {
        nextEl: '.ico.ico-next',
        prevEl: '.ico.ico-prev',
      },
      watchOverflow: true
    });
  });
}

function mainGameSlider(){
  var swiper = new Swiper('.timetable .slider .wrap', {
    observer: true,
    observeParents: true,
    loop: false,
    slidesPerView: 'auto',
    navigation: {
      nextEl: '.ico.ico-next',
      prevEl: '.ico.ico-prev',
    }
  });
}

function selectBox(){
  $('.select-box .val').click(function(){
    var box = $(this).parent('.select-box');
    box.toggleClass('on');
    $('.select-box').not(box).removeClass('on');
  });
  $('.select-box li').click(function(){
    var box = $(this).parents('.select-box');
    var txt = $(this).text();
    box.find('.val').text(txt);
    $(box).removeClass('on');
  });
  $("body").click(function (event) {
      if (!$(event.target).closest(".select-box").length) {
          $(".select-box").removeClass("on");
      }
  });
}

function linkPop(){
  $('.btn-link').click(function(){
    $('.pop').addClass('active');
  });
  $('.close').click(function(){
    $(this).parents('.pop').removeClass('active');
  });
}

function modalClose(){
  $('.btn-close').click(function(){
    $(this).parents('.modal-wrap').addClass('is-visible');
  });
}

// datatable Korean
var lang_kor = {
  "decimal" : "",
  "emptyTable" : "데이터가 없습니다.",
  "info" : "총 _END_ 건 검색되었습니다.",
  "infoEmpty" : "0",
  "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
  "infoPostFix" : "",
  "thousands" : ",",
  "lengthMenu" : "_MENU_",
  "loadingRecords" : "로딩중...",
  "processing" : "처리중...",
  "search" : "검색 : ",
  "zeroRecords" : "검색된 데이터가 없습니다.",
  "paginate" : {
      "first" : "< First",
      "last" : "Last >",
      "next" : "",
      "previous" : ""
  },
  "aria" : {
      "sortAscending" : " :  오름차순 정렬",
      "sortDescending" : " :  내림차순 정렬"
  }
};
function dataTable(){
  var datatable =  $('.data-table').DataTable({
    // 표시 건수기능
    lengthChange: false,
    "sDom": '<"top"i>rt<"paginate-wrap f-wrap"flp>',
    pagingType: 'simple_numbers',
    // 검색 기능
    searching: false,
    // 정보 표시
    info: false,
    order: [[0, 'asc']],
    ordering: true,
    responsive: false,
    paging:true,
    language: lang_kor,
    columnDefs: [{
      orderable: false,
      targets: "no-sort"
    }],
    iDisplayLength: 20
  })
}

function dataTableWithOrder(tableId, order, method){
  var datatable =  $(tableId).DataTable({
    // 표시 건수기능
    lengthChange: false,
    "sDom": '<"top"i>rt<"paginate-wrap f-wrap"flp>',
    pagingType: 'simple_numbers',
    // 검색 기능
    searching: false,
    // 정보 표시
    info: false,
    order: [[order, method]],
    ordering: true,
    responsive: false,
    paging:true,
    language: lang_kor,
    columnDefs: [{
      orderable: false,
      targets: "no-sort"
    }],
    iDisplayLength: 20
  })
}

function dataTable2(){
  $(".data-table2 th:not(.no-sort) > span").click(function(){
    $(this).toggleClass('active');
  });
}

function faqList(){
  $('.faq dt').click(function(){
    $(this).toggleClass('on');
  });
}

$(function(){
  header();
  tabContainer();
//  logoSlider();
  selectBox();
  modalClose();
  mainSlider();
})

$.fn.serializeObject = function () {
  var o = {};
  var a = this.serializeArray();
  $.each(a, function () {
    if (o[this.name]) {
      if (!o[this.name].push) {
        o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
};

function getCookie(cookieName){
  var cookieValue=null;
  if(document.cookie){
    var array=document.cookie.split((escape(cookieName)+'='));
    if(array.length >= 2){
      var arraySub=array[1].split(';');
      cookieValue=unescape(arraySub[0]);
    }
  }
  return cookieValue;
}

function setCookie(cookie_name, value, days) {
  var exdate = new Date();
  exdate.setDate(exdate.getDate() + days);
  // 설정 일수만큼 현재시간에 만료값으로 지정

  let domain = "";
  if (!location.host.includes("localhost")) {
    domain = "domain="+location.hostname.split(".").slice(1).join(".")+"; ";
  }
  var cookie_value = escape(value) + "; "+domain+"path=/" + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
  document.cookie  = cookie_name + '=' + cookie_value;
}

function deleteCookie(cookie_name) {
  let domain = "";
  if (!location.host.includes("localhost")) {
    domain = "domain="+location.hostname.split(".").slice(1).join(".")+"; ";
  }
  document.cookie = cookie_name + "=; "+domain+" path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT"
}

function getMember() {
  const token = getCookie("token");
  if (token) {
    const base64Payload = token.split('.')[1]; //value 0 -> header, 1 -> payload, 2 -> VERIFY SIGNATURE
    const result = JSON.parse(b64DecodeUnicode(base64Payload));
    return result.member;
  }
  return null;
}

function b64DecodeUnicode(str) {
  // Going backwards: from bytestream, to percent-encoding, to original string.
  return decodeURIComponent(atob(str).split('').map(function(c) {
    return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
  }).join(''));
}

function checkEmail(str) {
  var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
  if(!reg_email.test(str)) {
    return false;
  }
  else {
    return true;
  }
}

function checkPassword(pw) {
  const reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,20}$/;

  if(!reg.test(pw)) {
    return false;
  }
  return true
}

function getFormatDateByString(date, format) {
  if(date != null){
    date =  date.replace(/-/gi,'');
    //date =  date.replace('.','');

    if(date.length >= 8){

      if(!format || format == "yyyy.mm.dd"){
        date = date.substring(0,4)+"."+date.substring(4,6)+"."+date.substring(6,8);
      }
      if(format == "yyyy-mm-dd"){
        date = date.substring(0,4)+"-"+date.substring(4,6)+"-"+date.substring(6,8);
      }
      if(format == "mm.dd"){
        date = date.substring(4,6)+"."+date.substring(6,8);
      }
      if(format == "mm-dd"){
        date = date.substring(4,6)+"-"+date.substring(6,8);
      }
    }

    if( date.length  == 6 ){
      if(format == "yyyy.mm"){
        date = date.substring(0,4)+"."+date.substring(4,6);
      }
      if(format == "yyyy-mm"){
        date = date.substring(0,4)+"-"+date.substring(4,6);
      }
    }
  }

  return date;
}

function getYyyyMmDdMmSsToString(date) {
  var dd = date.getDate();
  var mm = date.getMonth()+1; //January is 0!

  var yyyy = date.getFullYear();
  if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}

  yyyy = yyyy.toString();
  mm = mm.toString();
  dd = dd.toString();

  var m = date.getHours();
  var s = date.getMinutes();

  if(m<10){m='0'+m} if(s<10){s='0'+s}
  m = m.toString();
  s = s.toString();

  var s1 = yyyy+'-'+mm+'-'+dd+' '+m+':'+s;
  return s1;
}

function getNumberWithComma (value) {
  if (!value) {
    return value;
  }

  return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function getPaginationHtml (pageNo, totalCount, pageSize, pageCount) {
  const paging = getPaging(pageNo, totalCount, pageSize, pageCount);
  console.log(paging);
  html = "";
  html += '<ul class="pagination">'
  html += '  <li class="prev first" onclick="javascript:gotoPage(1)"><span>처음으로</span></li>'
  if (paging.pageNoBegin > 1) {
    html += '  <li class="prev" onclick="javascript:gotoPage('+(paging.pageNoBegin-1)+')"><span>이전</span></li>'
  } else {
    html += '  <li class="prev disabled"><span>이전</span></li>'
  }
  for (let i = paging.pageNoBegin; i <= paging.pageNoEnd; i++) {
    if (i == paging.pageNo) {
      html += '  <li class="num active">'+i+'</li>'
    } else {
      html += '  <li class="num" onclick="javascript:gotoPage('+i+')">'+i+'</li>'
    }
  }
  if (paging.maxPageNo > paging.pageNoEnd) {
    html += '  <li class="next" onclick="javascript:gotoPage('+(paging.pageNoEnd+1)+')"><span>다음</span></li>'
  } else {
    html += '  <li class="next disabled"><span>다음</span></li>'
  }
  html += '  <li class="next last" onclick="javascript:gotoPage('+paging.maxPageNo+')"><span>마지막으로</span></li>'
  html += '</ul>'
  return html;
}

function getPaging(pageNo, totalCount, pageSize, pageCount) {
  let pageNoBegin = 1;
  let pageNoEnd = 1;
  let maxPageNo = 1;
  if (totalCount) {
    maxPageNo = Math.floor(totalCount / pageSize) + ((totalCount % pageSize) > 0 ? 1 : 0);
    pageNoBegin = Math.floor((pageNo - 1) / pageCount) * pageCount + 1;
    pageNoEnd = maxPageNo < (pageNoBegin + pageCount - 1) ? maxPageNo : (pageNoBegin + pageCount - 1);
  }
  return {
    pageNo: pageNo,
    pageNoBegin: pageNoBegin,
    pageNoEnd: pageNoEnd,
    maxPageNo: maxPageNo,
    totalCount: totalCount,
  }
}