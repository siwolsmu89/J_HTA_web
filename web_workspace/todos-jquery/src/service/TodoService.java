package service;

import java.util.ArrayList;
import java.util.List;

import com.simple.dao.TodoDao;
import com.simple.vo.Todo;

public class TodoService {
	
	private TodoDao todoDao = new TodoDao();
	
	/**
	 * 새로운 일정 정보를 추가한다.
	 * 일정 번호는 시퀀스를 획득해 저장한 다음 DAO에 전달한다.
	 * @param todo 새 일정 정보
	 * @return 일정 번호가 포함된 일정 정보
	 * @throws Exception
	 */
	public Todo addNewTodo(Todo todo) throws Exception {
		return null;
	}
	
	/**
	 * 변경된 일정 정보를 저장한다.
	 * @param todo 변경된 일정 정보
	 * @return 변경된 일정 정보
	 * @throws Exception
	 */
	public Todo updateTodo(Todo todo) throws Exception {
		return null;
	}
	
	/**
	 * 지정한 사용자가 등록한 일정 정보들을 반환한다.
	 * @param userId 로그인된 사용자의 아이디
	 * @return 지정된 사용자가 저장한 모든 일정
	 * @throws Exception
	 */
	public List<Todo> getMyTodoList(String userId) throws Exception {
		List<Todo> todoList = new ArrayList<Todo>();
		
		return todoList;
	}
	
	/**
	 * 지정된 일정 번호에 해당하는 일정 상세 정보를 반환한다.
	 * @param todoNo 조회할 일정 번호
	 * @return 일정 상세 정보
	 * @throws Exception
	 */
	public Todo getTodoDetail(int todoNo) throws Exception {
		Todo todo = null;
		
		return todo;
	}
}
