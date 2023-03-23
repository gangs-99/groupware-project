package com.sh.groupware.todo.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.groupware.todo.model.dao.TodoDao;
import com.sh.groupware.todo.model.dto.Todo;
import com.sh.groupware.todo.model.dto.TodoBoard;
import com.sh.groupware.todo.model.dto.TodoList;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDao todoDao;
	
	@Override
	public int todoBoardEnroll(TodoBoard todoBoard) {
		return todoDao.todoBoardEnroll(todoBoard);
	}
	
	@Override
	public List<TodoBoard> selectTodoBoardByempId(String empId) {
		return todoDao.selectTodoBoardByempId(empId);
	}
	
	@Override
	public List<TodoBoard> selectAllTodoBoard() {
		return todoDao.selectAllTodoBoard();
	}	
	
	@Override
	public List<TodoList> selectTodoListByNo(String no) {
	    List<TodoList> todoLists =  new ArrayList<>();
	    	todoLists=	todoDao.selectTodoListByNo(no);
	    
			
			  if (todoLists.size() > 0) {
				  for (TodoList todoList : todoLists) {
			  todoList.setTodos(todoDao.selectTodoByTodoListNo(todoList.getNo()));
			  } 
				  }
			 
	    return todoLists;
	}
	@Override
	public TodoBoard selectOneTodoBoardByNo(String no) {
		return todoDao.selectOneTodoBoardByNo(no);
	}
	@Override
	public int todoListEnroll(Map<String,Object> param) {
		return todoDao.todoListEnroll(param);
	}
	@Override
	public TodoList selectLastTodoList(Map<String,Object> param) {
		return todoDao.selectLastTodoList(param);
	}
	@Override
	public int todoEnroll(Todo todo) {
		return todoDao.todoEnroll(todo);
	}
	@Override
	public Todo todoSelectByNo(String no) {
		return todoDao.todoSelectByNo(no);
	}
	@Override
	public int todoListUpdate(TodoList todoList) {
		return todoDao.todoListUpdate(todoList);
	}
	@Override
	public int todoListDelete(TodoList todoList) {
		return todoDao.todoListDelete(todoList);
	}
	@Override
	public int todoInfoUpdate(Todo todo) {
		return todoDao.todoInfoUpdate(todo);
	}
	@Override
	public int todoContentUpdate(Todo todo) {
		return todoDao.todoContentUpdate(todo);
	}
	@Override
	public int todoDelete(Todo todo) {
		return todoDao.todoDelete(todo);
	}
	@Override
	public int commentEnroll(Map<String, Object> param) {
		return todoDao.commentEnroll(param);
	}
	@Override
	public int bookMarkOn(String todoBoardNo) {
		return todoDao.bookMarkOn(todoBoardNo);
	}
	@Override
	public TodoBoard selectLastTodoBoardByNo(String todoBoardNo) {
		return todoDao.selectLastTodoBoardByNo(todoBoardNo);
	}
	
}
