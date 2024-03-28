package mybatis.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MoviePaging {
   
   // 상영 목록 볼 때 쓸 페이징
   
   private int currentPage;      // 현재 페이지
   private int totalCount;         // 영화의 전체 갯수
   private int pageSize;         // 페이지마다 보여 줄 글의 갯수
   private int totalPage;         // 전체 페이지의 갯수
   private int startPage;         // 시작 페이지
   private int endPage;            // 마지막 페이지
   
   private int startNo;             // 화면에 보이는 글 목록의 시작 
   private int endNo;            // 화면에 보이는 글 목록의 마지막
   
   public MoviePaging(int currentPage, int totalCount, int pageSize) {
      this.totalCount = totalCount;
      this.pageSize = pageSize;

      totalPage = (int)Math.ceil((double)totalCount/pageSize);
      this.currentPage = (currentPage > totalPage)? totalPage: currentPage;
      this.currentPage = (currentPage < 1)? 1:this.currentPage;
      
      startNo=(this.currentPage-1)*pageSize+1;
      endNo = startNo + (pageSize-1);
      
      startPage = (this.currentPage-1)/10*10+1;
      endPage = startPage+9;
      endPage = endPage > totalPage ? totalPage:endPage;
      
   }
   

}