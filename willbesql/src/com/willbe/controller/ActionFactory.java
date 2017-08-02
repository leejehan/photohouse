package com.willbe.controller;

import com.willbe.controller.action.*;

public class ActionFactory {
	private static ActionFactory instance=new ActionFactory();
	public ActionFactory(){
		super();
	}
	public static ActionFactory getInstance(){
		return instance;
	}
	public Action getAction(String command){
		Action action=null;
		System.out.println("ActionFactory: " +command);
		
		if(command.equals("login")){
			action=new LoginAction();
		}else if(command.equals("find")){
			action=new FindMemberFormAction();
		}else if(command.equals("find_input")){
			action=new FindMemberAction();
		}else if(command.equals("findSucess")){
			action=new FindResultSucessAction();
		}else if(command.equals("menu")){
			action=new InputMenuAction();
		}else if(command.equals("join")){
			action=new JoinFormAction();
		}else if(command.equals("insertmember")){
			action=new JoinMemberAction();
		}else if(command.equals("checkId")){
			action=new CheckIdFormAction();
		}else if(command.equals("schedule")){
			action=new ScheduleAction();
		}else if(command.equals("prevmonth")){
			action=new PrevMonthAction();
		}else if(command.equals("nextmonth")){
			action=new NextMonthAction();
		}else if(command.equals("schecon")){
			action=new ScheduleContentsAction();
		}else if(command.equals("insertSchedule")){
			action=new InsertScheduleAction();
		}else if(command.equals("insertScheduleForm")){
			action=new InsertScheduleFormAction();
		}else if(command.equals("delschedule")){
			action=new DeleteScheduleAction();
		}else if(command.equals("diary")){
			action=new DiaryAction();
		}else if(command.equals("diarynextmonth")){
			action=new DiaryNextMonthAction();
		}else if(command.equals("diaryprevmonth")){
			action=new DiaryPrevMonthAction();
		}else if(command.equals("diarydate")){
			action=new DiaryDateAction();
		}else if(command.equals("insertdiary")){
			action=new DiaryInsertAction();
		}else if(command.equals("insertdiaryform")){
			action=new DiaryInsertFormAction();
		}else if(command.equals("updatediary")){
			action=new DiaryUpdateAction();
		}else if(command.equals("updatediaryform")){
			action=new DiaryUpdateFormAction();
		}else if(command.equals("mywallet")){
			action=new MyWalletAction();
		}else if(command.equals("walletinput")){
			action=new WalletInsertFormAction();
		}else if(command.equals("walletprev")){
			action=new WalletPrevAction();
		}else if(command.equals("walletnext")){
			action=new WalletNextAction();
		}else if(command.equals("mypage")){
			action=new MyPageAction();
		}else if(command.equals("deleteconfirm")){
			action=new GetOutConfirmAction();
		}else if(command.equals("deletemember")){
			action=new GetOutMemberAction();
		}else if(command.equals("updatemember")){
			action=new UpdateMemberAction();
		}else if(command.equals("updateuser")){
			action=new UpdateMemberSubmitAction();
		}
		return action;
	}
	
}
