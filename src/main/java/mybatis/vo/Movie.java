package mybatis.vo;

import java.sql.Date;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class Movie {
	private int mcode; 	// 코드
	private String mname;	// 제목
	private String genre;	// 장르
	private String director;	// 감독
	private String release_date;	// 개봉일
	private String producer;	// 제작사 및 배급사	
	private int rating;            // 관람 등급
	private String running_time;	// 상영시간
	private String synopsys;	// 줄거리	
	private double mgrade;	// 평점
	private String country;	// 국가
	private String mcast;	// 배우
	private String poster; // 포스터
	private int comments; // select, search할때 TBL_MOVIECOMMENTS에서 가져오는 CONTENT수
	@Setter
	private Map<String, String> commentMap; // content로 이루어진 list. 컨트롤러나 비동기 api에서 임의로 넣어줌
	private int cidx; // 일부 쿼리문에서 JOIN으로 가져오는 스케쥴 테이블 내용 
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date schedule; // 일부 쿼리문에서 JOIN으로 가져오는 스케쥴 테이블 내용 
}
