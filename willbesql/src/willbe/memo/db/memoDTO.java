package willbe.memo.db;

public class memoDTO {
	private int memo_num;
	private String memeber_id;
	private String memo_contents;
	private String memo_color;
	

	public memoDTO(int memo_num, String contents, String color) {		
		this.memo_num=memo_num;
		this.memo_contents=contents;
		this.memo_color=color;
	}
	public int getMemo_num() {
		return memo_num;
	}
	public void setMemo_num(int memo_num) {
		this.memo_num = memo_num;
	}
	public String getMemeber_id() {
		return memeber_id;
	}
	public void setMemeber_id(String memeber_id) {
		this.memeber_id = memeber_id;
	}
	public String getMemo_contents() {
		return memo_contents;
	}
	public void setMemo_contents(String memo_contents) {
		this.memo_contents = memo_contents;
	}
	public String getMemo_color() {
		return memo_color;
	}
	public void setMemo_color(String memo_color) {
		this.memo_color = memo_color;
	}
	
}
