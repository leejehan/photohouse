package willbe.question.db;

import java.sql.Timestamp;

public class replyDTO {
	private int reply_num;
	private int board_num;
	private String member_id;
	private String reply_contents;
	private Timestamp reply_date;	
	private int replyCount;
	public replyDTO(){}
	
	public replyDTO(int reply_num, int board_num, String member_id, String reply_contents, Timestamp reply_date) {
		this.reply_num=reply_num;
		this.board_num=board_num;
		this.member_id=member_id;
		this.reply_contents=reply_contents;
		this.reply_date=reply_date;
	}
	public replyDTO(int replyCount) {
		this.replyCount=replyCount;
	}

	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	public Timestamp getReply_date() {
		return reply_date;
	}
	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}	
	
}
