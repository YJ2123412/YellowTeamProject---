package mybatis.vo;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
@Getter
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Reserve {
	private int rcode;
	private String member_code;
	private int theater;
	private String movie_code;
	private Date reserve_date;
	private String scheduleDate;
	private Date schedule;
	@Setter
	private String seat;
	private int price;
	
	
	public Reserve(String member_code, int theater, String movie_code, String scheduleDate,
			String seat,int price) 
	{this.member_code=member_code;
	this.theater=theater;
	this.movie_code=movie_code;
	this.scheduleDate=scheduleDate;
	this.seat=seat;
	this.price=price;
	}
	
	/*
	 * public Reserve(int rcode, String member_code, int theater, String movie_code,
	 * String scheduleDate, Date reserve_date, String seat,int price) { this.rcode =
	 * rcode; this.member_code = member_code; this.theater = theater;
	 * this.movie_code = movie_code; this.reserve_date = reserve_date;
	 * this.scheduleDate = scheduleDate; this.seat = seat; this.price = price; }
	 */
}