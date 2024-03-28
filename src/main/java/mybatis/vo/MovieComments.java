package mybatis.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
public class MovieComments {
	private int idx;
	private int mcode;
	private String writer;
	private String content;
	private Date createdat;
	private int score;
}
