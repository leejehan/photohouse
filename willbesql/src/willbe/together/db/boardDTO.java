package willbe.together.db;

import java.sql.Timestamp;

public class boardDTO {
	private int board_num;
	private String member_id;
	private String board_title;
	private String board_contents;
	private Timestamp board_date;
	private int board_readcount;
	private int board_like;
	private String board_file;
	private int board_numCount;
	private int listSize;
	private int pageNum;
	private int remcount;
	private int currentPage;
	private int pageSize;
	private int fp;
	private int lp;
	
	public boardDTO(){}
	
	
	public boardDTO(int fp, int lp){
		this.fp=fp;
		this.lp=lp;
	}
	
	public boardDTO(int num, String title, String id, Timestamp date, int readcount, int like) {
		this.board_num=num;
		this.board_title=title;
		this.member_id=id;
		this.board_date=date;
		this.board_readcount=readcount;
		this.board_like=like;
	}
	public boardDTO(String id) {
		this.member_id=id;
	}
	public boardDTO(String num, String id, String title, Timestamp date, String contents, int readcount, int like, String file) {
		this.board_num=Integer.parseInt(num);
		this.member_id=id;
		this.board_title=title;
		this.board_date=date;
		this.board_contents=contents;
		this.board_readcount=readcount;
		this.board_like=like;
		this.board_file=file;		
	}
	public boardDTO(String num, String id, String title, String contents, String file) {
		this.board_num=Integer.parseInt(num);
		this.member_id=id;
		this.board_title=title;
		this.board_contents=contents;
		this.board_file=file;
	}	
	public boardDTO(int board_numCount, int listSize, int pageNum, int remcount, int pageSize) {
		this.board_numCount=board_numCount;
		this.listSize=listSize;
		this.pageNum=pageNum;
		this.remcount=remcount;
		this.pageSize=pageSize;
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public int getBoard_numCount() {
		return board_numCount;
	}
	public void setBoard_numCount(int board_numCount) {
		this.board_numCount = board_numCount;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getRemcount() {
		return remcount;
	}
	public void setRemcount(int remcount) {
		this.remcount = remcount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFp() {
		return fp;
	}
	public void setFp(int fp) {
		this.fp = fp;
	}
	public int getLp() {
		return lp;
	}
	public void setLp(int lp) {
		this.lp = lp;
	}
	
}
