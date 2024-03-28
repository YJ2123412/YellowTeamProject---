package mybatis.vo;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class Cinema {
	private int idx;
	private String name;
	private String address;
	private String phone;
	private int theater;
	
}
